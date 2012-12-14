class PagesController < ApplicationController
  before_filter :redirect_from_root_if_no_page, only: [:show]

  def show
    @body_class = params[:page]

    expires_in 5.minutes, public: true
    if stale?(etag: page_file.path, last_modified: page_file.mtime, public: true)
      render page_for(params[:stage], params[:page])
    end
  end

  def redirect_from_root
    redirect_to page_path(stage: cookies[:stage] || 'beta', page: 'quickstart-guide') and return
  end

  private

  def redirect_from_root_if_no_page
    unless page_for(params[:stage], params[:page])
      redirect_from_root
    end
  end

  def page_file
    @page_files ||= {}
    @page_files[params[:page]] ||= File.new(Rails.root.join("app/views/#{page_for(params[:stage], params[:page])}.html.haml"))
  end

  def page_for(stage, page, options = {})
    options.reverse_merge(partial: false)
    page = Array.wrap(page).join('/')
    filename = page.dup
    filename.sub!(/([^\/]+)(\/)/, '\1\2_') if options[:partial]

    if File.exists?(Rails.root.join("app/views/pages/#{stage}/#{filename}.html.haml"))
      "pages/#{stage}/#{page}"
    elsif stage != 'stable'
      page_for('stable', page, options)
    else
      raise ActionController::RoutingError.new("#{stage}/#{page} couldn't be found.")
    end
  end
  helper_method :page_for

end

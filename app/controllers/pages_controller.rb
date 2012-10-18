class PagesController < ApplicationController
  caches_page :show

  def show
    @body_class = params[:page]

    render page_for(params[:stage], params[:page]) if fresh_required?
  end

  private

  def fresh_required?
    Rails.env.development? || Rails.env.test? || stale?(etag: page_sha1, last_modified: page_file.mtime, public: true)
  end

  def page_sha1
    Digest::SHA1.file(page_file).to_s
  end

  def page_file
    @page_file ||= File.new(Rails.root.join("app/views/#{page_for(params[:stage], params[:page])}.html.haml"))
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

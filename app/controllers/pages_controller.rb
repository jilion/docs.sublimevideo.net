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
    redirect_to page_path(stage: cookies[:stage] || 'stable', page: 'quickstart-guide') and return
  end

  private

  def redirect_from_root_if_no_page
    unless page_for(params[:stage], params[:page])
      redirect_from_root
    end
  end

  def page_file
    @page_files ||= {}
    @page_files[params[:page]] ||= File.new(page_expanded_path(params[:stage], params[:page]))
  end

  def page_for(*args)
    page_realpath(*args).sub(%r{^.+/views/}, '').sub(%r{/_}, '/').sub(/\.html\.(haml|textile)$/, '')
  end

  def page_realpath(stage, page_parts, options = {})
    @page_realpaths ||= Hash.new({})
    @page_realpaths[stage][page_parts] ||= begin
      options.reverse_merge!(partial: false)

      filename = Array.wrap(page_parts).join('/')
      filename.sub!(/([^\/]+)(\/)/, '\1\2_') if options[:partial]

      page_expanded_path(stage, filename).to_s
    end
  end
  helper_method :page_realpath

  def page_expanded_path(stage, filename)
    if f = Dir.glob("app/views/pages/{#{stage},stable}/#{filename}.html.{haml,textile}").try(:first)
      return f
    end

    raise ActionController::RoutingError.new("#{stage}/#{filename} couldn't be found.")
  end

end

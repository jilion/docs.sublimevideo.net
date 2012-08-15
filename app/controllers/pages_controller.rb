class PagesController < ApplicationController
  caches_page :show

  def show
    @body_class = params[:page]

    render "pages/#{params[:page]}" if stale?(etag: page_md5, last_modified: page_file.mtime, public: true)
  end

  private

  def page_md5
    Digest::SHA1.file(page_file).to_s
  end

  def page_file
    @page_file ||= File.new(Rails.root.join("app/views/pages/#{params[:page]}.html.haml"))
  end

end

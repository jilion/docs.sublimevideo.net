class PagesController < ApplicationController

  def show
    @body_class = params[:page]

    expires_in 30.seconds, 'max-stale' => 0, public: true
    render "pages/#{params[:page]}" if stale?(etag: page_md5, last_modified: page_file.mtime)
  end

  private

  def page_md5
    Digest::SHA1.file(page_file).to_s
  end

  def page_file
    @page_file ||= File.new(Rails.root.join("app/views/pages/#{params[:page]}.html.haml"))
  end

end

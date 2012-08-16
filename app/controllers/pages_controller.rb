class PagesController < ApplicationController
  caches_page :show

  def show
    @body_class = params[:page]

    render "pages/#{params[:page]}" if fresh_required?
  end

  private

  def fresh_required?
    Rails.env.development? || Rails.env.test? || stale?(etag: page_sha1, last_modified: page_file.mtime, public: true)
  end

  def page_sha1
    Digest::SHA1.file(page_file).to_s
  end

  def page_file
    @page_file ||= File.new(Rails.root.join("app/views/pages/#{params[:page]}.html.haml"))
  end

end

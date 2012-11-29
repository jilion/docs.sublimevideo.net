class PagesController < ApplicationController

  def show
    @body_class = params[:page]

    expires_in 5.minutes, public: true
    if stale?(etag: page_file.path, last_modified: page_file.mtime, public: true)
      render "pages/#{params[:page]}"
    end
  end

  private

  def page_file
    @page_file ||= File.new(Rails.root.join("app/views/pages/#{params[:page]}.html.haml"))
  end

end

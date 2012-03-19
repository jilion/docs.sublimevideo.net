class PagesController < ApplicationController

  # caches_page :show

  def show
    @body_class = params[:page]

    respond_to do |format|
      format.html { render "pages/#{params[:page]}" }
    end
  end

end

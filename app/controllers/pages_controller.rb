class PagesController < ApplicationController

  def show
    @body_class = params[:page]

    # expires_in 30.seconds, public: true
    render "pages/#{params[:page]}"
  end

end

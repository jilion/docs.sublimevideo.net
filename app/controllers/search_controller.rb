class SearchController < ApplicationController

  def index
    if request.post?
      redirect_to search_url(q: params[:q])
    else
      @results = Search::IndexTankWrapper.search("title:#{params[:q]}^2 OR text:#{params[:q]}", fetch: 'title')
    end
  end

end

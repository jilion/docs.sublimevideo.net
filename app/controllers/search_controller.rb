class SearchController < ApplicationController

  def index
    if request.post?
      redirect_to search_url(q: params[:q])
    else
      @results = Search.search("title:#{h(params[:q])}^2 OR text:#{h(params[:q])}", fetch: 'title')
    end
  end

end

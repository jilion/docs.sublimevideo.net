class SearchController < ApplicationController

  def index
    if request.post?
      redirect_to search_url(q: h(params[:q]))
    else
      SearchKeyword.increment(h(params[:q]))
      @results = Search.search("title:#{h(params[:q])}^2 OR text:#{h(params[:q])}", fetch: 'title')
    end
  end

end

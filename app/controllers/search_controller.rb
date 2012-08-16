class SearchController < ApplicationController

  def index
    SearchKeyword.increment(h(params[:q]))
    @results = Search.search("title:#{h(params[:q])}^2 OR text:#{h(params[:q])}", fetch: 'title')
  end

end

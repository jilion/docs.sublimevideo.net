class SearchController < ApplicationController

  def index
    @query = h(params[:q]).strip

    search_for_results
  end

  private

  def search_for_results
    unless @query.blank?
      SearchKeyword.increment(@query)
      @results = Search.search(params[:stage], "title:#{@query}^2 OR text:#{@query}", fetch: 'title')
    end
  end

end

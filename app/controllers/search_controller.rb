class SearchController < ApplicationController

  def index
    @query = h(params[:q]).strip

    search_for_results
  end

  private

  def search_for_results
    unless @query.blank?
      SearchKeyword.increment(@query)
      @results = Search.search("title:#{@query}^2 OR text:#{@query}", fetch: 'title').try(:[], 'results')
    end
  end

end

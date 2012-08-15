class SearchController < ApplicationController

  def index
    @results = Search::IndexTankWrapper.search(params[:q], fetch: 'title')
  end

end

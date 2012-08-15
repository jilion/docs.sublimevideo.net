class SearchController < ApplicationController

  def index
    @results = Search::IndexTankWrapper.search(params[:search], fetch: 'title,timestamp')
  end

end

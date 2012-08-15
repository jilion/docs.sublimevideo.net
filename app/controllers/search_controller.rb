class SearchController < ApplicationController

  def index
    @results = Search::IndexTankWrapper.search("title:#{params[:q]}^2 OR text:#{params[:q]}", fetch: 'title')
  end

end

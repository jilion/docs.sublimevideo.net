class ReleasesController < ApplicationController
  respond_to :html, :atom

  # caches_page :index

  def index
    @releases = Release.all.reverse

    respond_with(@releases)
  end

end

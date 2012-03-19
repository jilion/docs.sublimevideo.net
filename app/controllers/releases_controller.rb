class ReleasesController < ApplicationController
  respond_to :html, :atom

  def index
    @releases = Release.all.reverse

    respond_with(@releases)
  end

end

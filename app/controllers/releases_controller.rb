class ReleasesController < ApplicationController
  respond_to :html, :atom

  def index
    @releases = Release.all.reverse

    fresh_when(@releases.first, public: true)
    respond_with(@releases)
  end

end

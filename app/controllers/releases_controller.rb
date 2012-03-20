class ReleasesController < ApplicationController
  respond_to :html, :atom

  def index
    @releases = Release.all.reverse

    if stale?(@releases.first, public: true)
      respond_with(@releases)
    end
  end

end

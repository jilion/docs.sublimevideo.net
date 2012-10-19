require 'spec_helper'

describe ReleasesController do

  it { get('/releases').should      route_to('releases#index', stage: 'stable') }
  it { get('/beta/releases').should route_to('releases#index', stage: 'beta') }

end

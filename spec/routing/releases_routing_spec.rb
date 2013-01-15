require 'spec_helper'

describe ReleasesController do

  it { expect(get('/releases')).to      route_to('releases#index', stage: 'stable') }
  it { expect(get('/beta/releases')).to route_to('releases#index', stage: 'beta') }

end

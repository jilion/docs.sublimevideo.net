require 'spec_helper'

describe ReleasesController do

  it { expect(get('/releases')).to route_to('releases#index', stage: 'stable') }

end

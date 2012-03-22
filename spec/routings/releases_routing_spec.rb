require 'spec_helper'

describe ReleasesController do

  it { get('/releases').should route_to('releases#index') }

end

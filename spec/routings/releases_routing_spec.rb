require 'spec_helper'

describe ReleasesController do

  it { get(with_subdomain('docs', 'releases')).should route_to('releases#index') }

end

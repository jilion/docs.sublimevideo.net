require 'spec_helper'

describe PagesController do

  # Rails issue with advanced constraint https://github.com/dchelimsky/rspec-rails/issues/5
  it { get('/quickstart-guide').should route_to('pages#show', stage: 'stable', page: 'quickstart-guide') }
  it { get('/javascript-api/usage').should route_to('pages#show', stage: 'stable', page: 'javascript-api/usage') }

end

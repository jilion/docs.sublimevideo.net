require 'spec_helper'

describe PagesController do

  # Rails issue with advanced constraint https://github.com/dchelimsky/rspec-rails/issues/5
  it { expect(get('/quickstart-guide')).to route_to('pages#show', page: 'quickstart-guide') }
  it { expect(get('/javascript-api/usage')).to route_to('pages#show', page: 'javascript-api/usage') }

end

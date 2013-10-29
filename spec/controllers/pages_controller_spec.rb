require 'spec_helper'

describe PagesController do

  %w[javascript-api/usage].each do |page|
    it "responds with success to GET :show, on #{page} page" do
      get :show, page: page
      expect(response).to render_template("pages/#{page}")
    end
  end

  %w[quickstart-guide].each do |page|
    it "responds with success to GET :show, on #{page} page" do
      get :show, page: page
      expect(response).to render_template("pages/#{page}")
    end
  end

end

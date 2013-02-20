require 'spec_helper'

describe PagesController do

  %w[stable beta].each do |stage|
    context "#{stage} page" do
      %w[javascript-api/usage].each do |page|
        it "responds with success to GET :show, on #{page} page" do
          get :show, stage: stage, page: page
          response.should render_template("pages/stable/#{page}")
        end
      end
    end
  end

  %w[stable beta].each do |stage|
    context "#{stage} page" do
      %w[quickstart-guide].each do |page|
        it "responds with success to GET :show, on #{page} page" do
          get :show, stage: stage, page: page
          response.should render_template("pages/stable/#{page}")
        end
      end
    end
  end

end

# coding: utf-8
require 'spec_helper'

feature 'redirect legacy routes' do
  it "redirect /js-api to /javascript-api/usage" do
    visit '/js-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end

  it "redirect /javacript-api to /javascript-api/usage" do
    visit '/javascript-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end

  it "redirect /put-video-in-a-floating-lightbox to /lightbox" do
    visit '/put-video-in-a-floating-lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/lightbox"
  end
end

feature "root redirect to /quickstart-guide" do
  it "redirect" do
    visit '/'
    current_url.should eq "http://docs.sublimevideo.dev/quickstart-guide"
  end
end

feature "encode-videos-for-the-web" do
  it "is viewable" do
    visit '/encode-videos-for-the-web'
    current_url.should eq "http://docs.sublimevideo.dev/encode-videos-for-the-web"
  end
end

feature "faq" do
  it "is viewable" do
    visit '/faq'
    current_url.should eq "http://docs.sublimevideo.dev/faq"
  end
end

feature "javascript-api" do
  it "is viewable" do
    visit '/javascript-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end
end

feature "lightbox" do
  it "is viewable" do
    visit '/lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/lightbox"
  end
end

feature "quickstart-guide" do
  it "is viewable" do
    visit '/quickstart-guide'
    current_url.should eq "http://docs.sublimevideo.dev/quickstart-guide"
  end
end

feature "supported-browsers-and-platforms" do
  it "is viewable" do
    visit '/supported-browsers-and-platforms'
    current_url.should eq "http://docs.sublimevideo.dev/supported-browsers-and-platforms"
  end
end

feature "troubleshooting" do
  it "is viewable" do
    visit '/troubleshooting'
    current_url.should eq "http://docs.sublimevideo.dev/troubleshooting"
  end
end

feature "releases" do
  it "is viewable" do
    visit '/releases'
    current_url.should eq "http://docs.sublimevideo.dev/releases"
  end
end

feature "write-proper-video-elements" do
  it "is viewable" do
    visit '/write-proper-video-elements'
    current_url.should eq "http://docs.sublimevideo.dev/write-proper-video-elements"
  end
end
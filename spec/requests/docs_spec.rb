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

  it "redirect /autoplay-video-upon-page-load to /autoplay" do
    visit '/autoplay-video-upon-page-load'
    current_url.should eq "http://docs.sublimevideo.dev/autoplay"
  end

  it "redirect /customizing-the-initial-play-button to /custom-start-view" do
    visit '/customizing-the-initial-play-button'
    current_url.should eq "http://docs.sublimevideo.dev/custom-start-view"
  end

  it "redirect /custom-play-button to /custom-play-button" do
    visit '/custom-play-button'
    current_url.should eq "http://docs.sublimevideo.dev/custom-start-view"
  end

  it "redirect /loop-a-video to /loop" do
    visit '/loop-a-video'
    current_url.should eq "http://docs.sublimevideo.dev/loop"
  end

  it "redirect /returning-to-the-initial-state-once-video-playback-ends to /back-to-initial-state-on-end" do
    visit '/returning-to-the-initial-state-once-video-playback-ends'
    current_url.should eq "http://docs.sublimevideo.dev/back-to-initial-state-on-end"
  end

  it "redirect /put-video-in-a-floating-lightbox to /lightbox" do
    visit '/put-video-in-a-floating-lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/lightbox"
  end

  it "redirect /faq to /player-faq" do
    visit '/faq'
    current_url.should eq "http://docs.sublimevideo.dev/player-faq"
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

feature "player-faq" do
  it "is viewable" do
    visit '/player-faq'
    current_url.should eq "http://docs.sublimevideo.dev/player-faq"
  end
end

feature "service-faq" do
  it "is viewable" do
    visit '/service-faq'
    current_url.should eq "http://docs.sublimevideo.dev/service-faq"
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

feature "/beta/encode-videos-for-the-web" do
  it "is viewable" do
    visit '/beta/encode-videos-for-the-web'
    current_url.should eq "http://docs.sublimevideo.dev/beta/encode-videos-for-the-web"
  end
end

feature "/beta/player-faq" do
  it "is viewable" do
    visit '/beta/player-faq'
    current_url.should eq "http://docs.sublimevideo.dev/beta/player-faq"
  end
end

feature "/beta/service-faq" do
  it "is viewable" do
    visit '/beta/service-faq'
    current_url.should eq "http://docs.sublimevideo.dev/beta/service-faq"
  end
end

feature "/beta/javascript-api" do
  it "is viewable" do
    visit '/beta/javascript-api'
    current_url.should eq "http://docs.sublimevideo.dev/beta/javascript-api/usage"
  end
end

feature "/beta/lightbox" do
  it "is viewable" do
    visit '/beta/lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/beta/lightbox"
  end
end

feature "/beta/quickstart-guide" do
  it "is viewable" do
    visit '/beta/quickstart-guide'
    current_url.should eq "http://docs.sublimevideo.dev/beta/quickstart-guide"
  end
end

feature "/beta/supported-browsers-and-platforms" do
  it "is viewable" do
    visit '/beta/supported-browsers-and-platforms'
    current_url.should eq "http://docs.sublimevideo.dev/beta/supported-browsers-and-platforms"
  end
end

feature "/beta/troubleshooting" do
  it "is viewable" do
    visit '/beta/troubleshooting'
    current_url.should eq "http://docs.sublimevideo.dev/beta/troubleshooting"
  end
end

feature "/beta/releases" do
  it "is viewable" do
    visit '/beta/releases'
    current_url.should eq "http://docs.sublimevideo.dev/beta/releases"
  end
end

feature "/beta/write-proper-video-elements" do
  it "is viewable" do
    visit '/beta/write-proper-video-elements'
    current_url.should eq "http://docs.sublimevideo.dev/beta/write-proper-video-elements"
  end
end

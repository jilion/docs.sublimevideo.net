# coding: utf-8
require 'spec_helper'

feature 'redirect legacy javacript-api routes' do
  it "redirects /js-api to /javascript-api/usage" do
    visit '/js-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end

  it "redirects /javacript-api to /javascript-api/usage" do
    visit '/javascript-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end
end

feature 'redirect legacy custom-start-view routes' do
  it "redirects /customizing-the-initial-play-button to /custom-start-view" do
    visit '/customizing-the-initial-play-button'
    current_url.should eq "http://docs.sublimevideo.dev/custom-start-view"
  end

  it "redirects /custom-play-button to /custom-play-button" do
    visit '/custom-play-button'
    current_url.should eq "http://docs.sublimevideo.dev/custom-start-view"

    visit '/custom-play-button'
    current_url.should eq "http://docs.sublimevideo.dev/custom-start-view"
  end
end

feature 'redirect legacy autoplay routes' do
  it "redirects /autoplay-video-upon-page-load to /settings/player-settings#autoplay" do
    visit '/autoplay-video-upon-page-load'
    current_url.should eq "http://docs.sublimevideo.dev/settings/player-settings"
  end

  it "routes /autoplay in stable" do
    visit '/autoplay'
    current_url.should eq "http://docs.sublimevideo.dev/settings/player-settings"
  end
end

feature 'redirect legacy loop routes' do
  it "redirects /loop-a-video to /settings/player-settings#on-end" do
    visit '/loop-a-video'
    current_url.should eq "http://docs.sublimevideo.dev/settings/player-settings"
  end
end

feature 'redirect legacy back-to-initial-state-on-end routes' do
  it "redirects /returning-to-the-initial-state-once-video-playback-ends to /settings/player-settings#on-end" do
    visit '/returning-to-the-initial-state-once-video-playback-ends'
    current_url.should eq "http://docs.sublimevideo.dev/settings/player-settings"
  end
end


feature 'redirect other legacy routes' do
  it "redirect /ssl to /player-faq#use-sublimevideo-in-ssl-site" do
    visit '/ssl'
    current_url.should eq "http://docs.sublimevideo.dev/player-faq"
  end

  it "redirect /put-video-in-a-floating-lightbox to /lightbox" do
    visit '/put-video-in-a-floating-lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/lightbox"
  end

  it "redirect /faq to /player-faq" do
    visit '/faq'
    current_url.should eq "http://docs.sublimevideo.dev/player-faq"
  end

  it "redirect /real-time-stats to /addons/stats" do
    visit '/real-time-stats'
    current_url.should eq "http://docs.sublimevideo.dev/addons/stats"
  end

  it "redirect /optimize-for-stats to /addons/stats" do
    visit '/optimize-for-stats'
    current_url.should eq "http://docs.sublimevideo.dev/addons/stats"
  end

  it "redirect /supported-browsers-and-platforms to /supported-platforms" do
    visit '/supported-browsers-and-platforms'
    current_url.should eq "http://docs.sublimevideo.dev/supported-platforms"
  end
end

feature "shortcut redirects" do
  it "redirects root to /quickstart-guide" do
    visit '/'
    current_url.should eq "http://docs.sublimevideo.dev/quickstart-guide"
  end

  it "redirects /javascript-api to /javascript-api/usage" do
    visit '/javascript-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end
end

feature "shortcut beta redirects" do
  it "redirects /settings to /settings/usage" do
    visit '/settings'
    current_url.should eq "http://docs.sublimevideo.dev/settings/usage"
  end

  it "redirects /javascript-api to /javascript-api/usage" do
    visit '/javascript-api'
    current_url.should eq "http://docs.sublimevideo.dev/javascript-api/usage"
  end

  it "redirects /embeds to /addons/embed" do
    visit '/embeds'
    current_url.should eq "http://docs.sublimevideo.dev/addons/embed"
  end
end

feature "viewable pages" do
  it "renders encode-videos-for-the-web" do
    visit '/encode-videos-for-the-web'
    current_url.should eq "http://docs.sublimevideo.dev/encode-videos-for-the-web"
  end

  it "renders player-faq" do
    visit '/player-faq'
    current_url.should eq "http://docs.sublimevideo.dev/player-faq"
  end

  it "renders service-faq" do
    visit '/service-faq'
    current_url.should eq "http://docs.sublimevideo.dev/service-faq"
  end

  it "renders lightbox" do
    visit '/lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/lightbox"
  end

  it "renders quickstart-guide" do
    visit '/quickstart-guide'
    current_url.should eq "http://docs.sublimevideo.dev/quickstart-guide"
  end

  it "renders supported-platforms" do
    visit '/supported-platforms'
    current_url.should eq "http://docs.sublimevideo.dev/supported-platforms"
  end

  it "renders troubleshooting" do
    visit '/troubleshooting'
    current_url.should eq "http://docs.sublimevideo.dev/troubleshooting"
  end

  it "renders releases" do
    visit '/releases'
    current_url.should eq "http://docs.sublimevideo.dev/releases"
  end

  it "renders write-proper-video-elements" do
    visit '/write-proper-video-elements'
    current_url.should eq "http://docs.sublimevideo.dev/write-proper-video-elements"
  end
end

feature "viewable beta pages" do
  it "renders beta/encode-videos-for-the-web" do
    visit '/encode-videos-for-the-web'
    current_url.should eq "http://docs.sublimevideo.dev/encode-videos-for-the-web"
  end

  it "renders beta/player-faq" do
    visit '/player-faq'
    current_url.should eq "http://docs.sublimevideo.dev/player-faq"
  end

  it "renders beta/service-faq" do
    visit '/service-faq'
    current_url.should eq "http://docs.sublimevideo.dev/service-faq"
  end

  it "renders beta/lightbox" do
    visit '/lightbox'
    current_url.should eq "http://docs.sublimevideo.dev/lightbox"
  end

  it "renders beta/quickstart-guide" do
    visit '/quickstart-guide'
    current_url.should eq "http://docs.sublimevideo.dev/quickstart-guide"
  end

  it "renders beta/supported-platforms" do
    visit '/supported-platforms'
    current_url.should eq "http://docs.sublimevideo.dev/supported-platforms"
  end

  it "renders beta/troubleshooting" do
    visit '/troubleshooting'
    current_url.should eq "http://docs.sublimevideo.dev/troubleshooting"
  end

  it "renders beta/releases" do
    visit '/releases'
    current_url.should eq "http://docs.sublimevideo.dev/releases"
  end

  it "renders beta/write-proper-video-elements" do
    visit '/write-proper-video-elements'
    current_url.should eq "http://docs.sublimevideo.dev/write-proper-video-elements"
  end
end

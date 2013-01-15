# coding: utf-8
require 'spec_helper'

feature 'checks all links' do
  it "routes all links" do
    visit '/'
    all('nav#docs_menu a').each do |a|
      if a[:href] =~ %r{\A(/|http://docs\.sublimevideo\.dev)}
        puts "On: #{current_url}, click on #{a[:href]} in the menu."
        a.click

        current_url_match(a[:href])

        all('div.content_wrapper a').each do |a|
          if a[:href] =~ %r{\A(/|http://docs\.sublimevideo\.dev)}
            puts "\tOn: #{current_url}, click on #{a[:href]}."
            a.click

            current_url_match(a[:href])
          end
        end
      end
    end
  end
end

def current_url_match(href)
  if href =~ %r{\A/}
    current_url.should eq "http://docs.sublimevideo.dev#{route_with_redirect(href)}"
  else
    current_url.should eq href.sub(/#.+/, '')
  end
end

def route_with_redirect(href)
  case href
  when %r{/(settings|javascript-api)\z}
    href + '/usage'
  else
    href
  end.sub(/#.+/, '')
end

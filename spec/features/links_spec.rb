# coding: utf-8
require 'spec_helper'

feature 'checks all links' do
  %w[stable beta].each do |stage|
    it "routes all links in #{stage} stage" do
      visit "http://docs.sublimevideo.dev/?new_stage=#{stage}"
      stage = nil if stage == 'stable'

      all('nav#docs_menu a').each do |a|
        if a[:href] =~ %r{\A(/|http://docs\.sublimevideo\.dev)} || a[:href] !~ %r{\A(https?:|#)}
          puts "On: #{current_url}, click on #{a[:href]} in the menu."
          a.click

          current_url_match(a[:href], stage: stage)

          back_to_page = current_url

          all('#content .content_wrapper a').each do |a|
            if a[:href] =~ %r{\A(/|http://docs\.sublimevideo\.dev)} || a[:href] !~ %r{\A(https?:|#)}
              puts "\tOn: #{current_url}, click on #{a[:href]}."
              a.click

              current_url_match(a[:href], stage: stage, referer: back_to_page)

              visit back_to_page
            end
          end
        end
      end
    end
  end
end

def current_url_match(href, options = {})
  if href !~ %r{\Ahttps?:}
    url = relative_url?(href) && multi_level_path?(options[:referer], options) ? [options[:referer].sub(%r{/[^/]+\z}, '')] : ['http://docs.sublimevideo.dev']
    url << options[:stage] if href !~ %r{\A(https?:|/)} && !multi_level_path?(options[:referer], options)
    url << route_with_redirect(href, options[:stage]).sub(%r{\A/+}, '')
    current_url.should eq url.compact.join('/')
  else
    expected_url = route_with_redirect(href, options[:stage])
    expected_url.blank? || (current_url.should eq expected_url)
  end
end

def relative_url?(url)
  url !~ %r{\A(https?:|/)}
end

def multi_level_path?(path, options = {})
  path.sub(%r{http://docs\.sublimevideo\.dev/#{options[:stage]}/?}, '') =~ %r{/}
end

def route_with_redirect(href, stage)
  case href
  when %r{(/settings|javascript-api)\z}
    href + '/usage'
  when %r{custom-play-button\z}
    '/custom-start-view'
  when %r{optimize-for-stats\z}
    '/addons/stats'
  when %r{embeds\z}
    stage == 'beta' ? '/addons/embed' : href
  else
    href
  end.sub(/#.+/, '')
end

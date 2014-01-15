# coding: utf-8
require 'spec_helper'

feature 'checks all links' do
  it "routes all links" do
    visit "http://docs.sublimevideo.dev"

    all('nav#docs_menu a').each do |a|
      if a[:href].present? && (a[:href] =~ %r{\A(/|http://docs\.sublimevideo\.dev)} || a[:href] !~ %r{\A(https?:|#)})
        puts "On #{current_url}, click #{a[:href]} in the menu."
        a.click

        current_url_match(a[:href])

        back_to_page = current_url

        all('#content .content_wrapper a').each do |a|
          if a[:href].present? && (a[:href] =~ %r{\A(/|http://docs\.sublimevideo\.dev)} || a[:href] !~ %r{\A(https?:|#)})
            puts "\tOn #{current_url}, click #{a[:href]}."
            a.click

            current_url_match(a[:href], referer: back_to_page)

            visit back_to_page
          end
        end
      end
    end
  end
end

def current_url_match(href, options = {})
  if href !~ %r{\Ahttps?:}
    url = relative_url?(href) && multi_level_path?(options[:referer], options) ? [options[:referer].sub(%r{/[^/]+\z}, '')] : ['http://docs.sublimevideo.dev']
    url << route_with_redirect(href).sub(%r{\A/+}, '')
    expect(current_url).to eq url.compact.join('/')
  else
    expected_url = route_with_redirect(href)
    expected_url.blank? || (expect(current_url).to eq expected_url)
  end
end

def relative_url?(url)
  url !~ %r{\A(https?:|/)}
end

def multi_level_path?(path, options = {})
  path.sub(%r{http://docs\.sublimevideo\.dev/?}, '') =~ %r{/}
end

def route_with_redirect(href)
  case href
  when %r{(/settings|javascript-api)\z}
    href + '/usage'
  when %r{custom-play-button\z}
    '/custom-start-view'
  when %r{embeds\z}
    href
  else
    href
  end.sub(/#.+/, '')
end

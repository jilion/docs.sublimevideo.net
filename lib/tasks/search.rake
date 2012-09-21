# require 'navigation'

namespace :search do

  desc "Index all document for full-text search"
  task index: :environment do
    class SearchHelper
      include DocsHelper
    end
    search_helper = SearchHelper.new

    %w[stable beta].each do |version|
      documents  = []
      pages_glob = Rails.root.join('app', 'views', 'pages', version, '**', '*.html.haml')
      Dir[pages_glob].each do |page|
        permalink = page.sub(/#{Rails.root.join('app', 'views', 'pages', version).to_s}\/([\w\-\/]+)\.html\.haml$/, '\1')
        next if permalink =~ /_/ # skip partial pages

        text = if version == 'beta' and complex_page = %w[player-faq service-faq troubleshooting].find { |page| page == permalink }
          sub_pages_glob = Rails.root.join('app', 'views', 'pages', version, complex_page, '_*.html.haml')
          Dir[pages_glob].inject('') { |memo, page| memo += File.new(page).read }
        else
          File.new(page).read
        end

        puts "Adding #{permalink} => #{search_helper.section_and_page_title_from_permalink(version, permalink)}"
        documents << { docid: permalink, fields: { text: text, title: "#{search_helper.section_and_page_title_from_permalink(version, permalink)}" } }
      end

      Search.delete_index(version)
      Search.add_documents(version, documents)
      Search.add_function(version, 0, 'relevance')
    end
  end

end

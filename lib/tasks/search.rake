require 'navigation'

namespace :search do

  desc "Index all document for full-text search"
  task index: :environment do
    pages_glob = Rails.root.join('app', 'views', 'pages', '**', '*.html.haml')
    documents  = []

    Dir[pages_glob].each do |page|
      permalink = page.sub(/#{Rails.root.join('app', 'views', 'pages/').to_s}([\w\-\/]+)\.html\.haml$/, '\1')
      file      = File.new(page)

      documents << { docid: permalink, fields: { text: file.read, title: Navigation.menu_title(permalink) } }
    end

    Search.delete_index
    Search.add_documents(documents)
    Search.add_function(0, 'relevance')
  end

end

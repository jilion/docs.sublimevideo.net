namespace :search do

  desc "Index all document for full-text search"
  task indexing: :environment do
    pages_glob = Rails.root.join('app', 'views', 'pages', '**', '*.html.haml')
    documents  = []

    Dir[pages_glob].each do |page|
      permalink = page.sub(/#{Rails.root.join('app', 'views', 'pages/').to_s}([\w\-\/]+)\.html\.haml$/, '\1')
      file      = File.new(page)

      documents << { docid: permalink, fields: { text: file.read, title: Page.menu_title(permalink) } } # , timestamp: file.mtime.to_i } }
    end

    Search::IndexTankWrapper.delete_index
    Search::IndexTankWrapper.batch_insert(documents)
  end

end

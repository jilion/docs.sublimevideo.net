# coding: utf-8
module Search
  module IndexTankWrapper

    class << self

      def search(version, *args)
        index(version).search(*args)
      end

      def add_documents(version, documents)
        puts "Indexing #{documents.size} documents in index 'idx:#{version}'..."
        index(version).batch_insert(documents)
      end

      def add_function(version, num, fn)
        puts "Adding function ##{num}: #{fn} to index 'idx:#{version}"
        index(version).functions(num, fn).add
      end

      def delete_index(version)
        puts "Deleting 'idx:#{version}' index..."
        index(version).delete
        @index = nil
      end

    private

      def client
        @client ||= IndexTank::Client.new(ENV['INDEXDEN_URL'])
      end

      def index(version = 'stable')
        @index ||= {}
        @index[version] ||= begin
          idx = client.indexes("idx:#{version}")

          unless idx.exists?
            puts "Creating 'idx:#{version}' index..."
            idx.add public_search: false
            sleep 0.5 while !idx.running?
            puts "'idx:#{version}' index created!"
          end

          idx
        end
      end

    end

  end
end

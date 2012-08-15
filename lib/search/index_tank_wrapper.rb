# coding: utf-8
module Search
  module IndexTankWrapper

    class << self

      def search(*args)
        index.search(*args)
      end

      def batch_insert(documents)
        puts "Indexing #{documents.size} documents..."
        index.batch_insert(documents)
      end

      def delete_index
        puts "Deleting 'idx' index..."
        resp = index.delete
        puts resp.inspect
        @index = nil
      end

    private

      def client
        @client ||= IndexTank::Client.new(ENV['HOUNDSLEUTH_URL'])
      end

      def index
        @index ||= begin
          idx = client.indexes('idx')

          unless idx.exists?
            puts "Creating 'idx' index..."
            idx.add public_search: false
            sleep 0.5 while !idx.running?
            puts "'idx' index created!"
          end

          idx
        end
      end

    end

  end
end

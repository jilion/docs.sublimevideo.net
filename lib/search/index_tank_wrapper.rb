# coding: utf-8
require 'timeout'

module Search
  module IndexTankWrapper

    class << self

      def search(*args)
        Timeout.timeout(10) do
          index.search(*args)
        end
      rescue Timeout::Error => ex
        Airbrake.notify(ex) if Rails.env.production? || Rails.env.staging?
        nil
      end

      def add_documents(documents)
        puts "Indexing #{documents.size} documents..."
        index.batch_insert(documents)
      end

      def add_function(num, fn)
        puts "Adding function ##{num}: #{fn}"
        index.functions(num, fn).add
      end

      def delete_index
        puts "Deleting 'idx' index..."
        index.delete
        @index = nil
      end

    private

      def client
        @client ||= IndexTank::Client.new(ENV['INDEXDEN_URL'])
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

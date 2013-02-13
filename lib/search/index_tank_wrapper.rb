# coding: utf-8
require 'timeout'

module Search
  module IndexTankWrapper

    class << self

      def search(stage, *args)
        Timeout.timeout(20) do
          index(stage).search(*args)
        end
      rescue Timeout::Error => ex
        Airbrake.notify(ex) if Rails.env.production? || Rails.env.staging?
        nil
      end

      def add_documents(stage, documents)
        puts "Indexing #{documents.size} documents in index 'idx_#{stage}'..."
        index(stage).batch_insert(documents)
      end

      def add_function(stage, num, fn)
        puts "Adding function ##{num}: #{fn} to index 'idx_#{stage}"
        index(stage).functions(num, fn).add
      end

      def delete_index(stage)
        puts "Deleting 'idx_#{stage}' index..."
        index(stage).delete
        @index = nil
      end

    private

      def client
        @client ||= IndexTank::Client.new(ENV['INDEXDEN_URL'])
      end

      def index(stage = 'stable')
        @index ||= {}
        @index[stage] ||= begin
          idx = client.indexes("idx_#{stage}")

          unless idx.exists?
            puts "Creating 'idx_#{stage}' index..."
            idx.add public_search: false
            sleep 0.5 while !idx.running?
            puts "'idx_#{stage}' index created!"
          end

          idx
        end
      end

    end

  end
end

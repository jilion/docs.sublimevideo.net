# coding: utf-8
require 'timeout'

module Search
  module IndexTankWrapper

    class << self

      def search(stage, *args)
        Timeout.timeout(20) do
          index(stage).search(*args)
        end
      rescue IndexTank::InvalidQuery
        nil
      rescue Timeout::Error => ex
        Airbrake.notify(ex) if Rails.env.production? || Rails.env.staging?
        nil
      end

      def add_document(stage, document)
        puts "==> Indexing #{document[:docid]} in index 'idx_#{stage}'..."
        index(stage).document(document[:docid]).add(document[:fields])
        puts "    #{document[:docid]} indexed in 'idx_#{stage}'!"
      end

      def add_documents(stage, documents)
        puts "==> Indexing #{documents.size} documents in index 'idx_#{stage}'..."
        index(stage).batch_insert(documents)
        puts "    #{documents.size} documents indexed in 'idx_#{stage}'!"
      end

      def add_function(stage, num, fn)
        puts "==> Adding function ##{num}: #{fn} to index 'idx_#{stage}"
        index(stage).functions(num, fn).add
        puts "    Function ##{num}: #{fn} added to index 'idx_#{stage}!"
      end

      def delete_index(stage)
        puts "==> Deleting 'idx_#{stage}' index..."
        index(stage).delete
        puts "    'idx_#{stage}' index deleted!"
        @index = nil
      end

    private

      def client
        @client ||= IndexTank::Client.new(ENV['INDEXTANK_URL'])
      end

      def index(stage = 'stable')
        @index ||= {}
        @index[stage] ||= begin
          idx = client.indexes("idx_#{stage}")

          unless idx.exists?
            puts "\n==> Creating 'idx_#{stage}' index..."
            idx.add public_search: false
            puts "    'idx_#{stage}' index created!"
            sleep 0.5 while !idx.running?
            puts "    'idx_#{stage}' index running!"
          end

          idx
        end
      end

    end

  end
end

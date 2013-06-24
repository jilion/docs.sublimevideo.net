# coding: utf-8
require 'timeout'

class IndexTankWrapper

  def self.search(*args)
    Timeout.timeout(20) do
      index.search(*args)
    end
  rescue IndexTank::InvalidQuery
    nil
  rescue Timeout::Error => ex
    Honeybadger.notify_or_ignore(ex)
    nil
  end

  def self.add_document(document)
    puts "==> Indexing #{document[:docid]} in index 'idx_stable'..."
    index.document(document[:docid]).add(document[:fields])
    puts "    #{document[:docid]} indexed in 'idx_stable'!"
  end

  def self.add_documents(documents)
    puts "==> Indexing #{documents.size} documents in index 'idx_stable'..."
    index.batch_insert(documents)
    puts "    #{documents.size} documents indexed in 'idx_stable'!"
  end

  def self.add_function(num, fn)
    puts "==> Adding function ##{num}: #{fn} to index 'idx_stable"
    index.functions(num, fn).add
    puts "    Function ##{num}: #{fn} added to index 'idx_stable!"
  end

  def self.delete_index
    puts "==> Deleting 'idx_stable' index..."
    index.delete
    puts "    'idx_stable' index deleted!"
    @index = nil
  end

  private

  def self.client
    @client ||= IndexTank::Client.new(ENV['INDEXTANK_URL'])
  end

  def self.index
    @index ||= begin
      idx = client.indexes('idx_stable')

      unless idx.exists?
        puts "\n==> Creating 'idx_stable' index..."
        idx.add public_search: false
        puts "    'idx_stable' index created!"
        sleep 0.5 while !idx.running?
        puts "    'idx_stable' index running!"
      end

      idx
    end
  end

end

# coding: utf-8
require 'timeout'

class IndexTankWrapper

  def self.search(stage, *args)
    Timeout.timeout(20) do
      index(stage).search(*args)
    end
  rescue IndexTank::InvalidQuery
    nil
  rescue Timeout::Error => ex
    Honeybadger.notify_or_ignore(ex)
    nil
  end

  def self.add_document(stage, document)
    puts "==> Indexing #{document[:docid]} in index 'idx_#{stage}'..."
    index(stage).document(document[:docid]).add(document[:fields])
    puts "    #{document[:docid]} indexed in 'idx_#{stage}'!"
  end

  def self.add_documents(stage, documents)
    puts "==> Indexing #{documents.size} documents in index 'idx_#{stage}'..."
    index(stage).batch_insert(documents)
    puts "    #{documents.size} documents indexed in 'idx_#{stage}'!"
  end

  def self.add_function(stage, num, fn)
    puts "==> Adding function ##{num}: #{fn} to index 'idx_#{stage}"
    index(stage).functions(num, fn).add
    puts "    Function ##{num}: #{fn} added to index 'idx_#{stage}!"
  end

  def self.delete_index(stage)
    puts "==> Deleting 'idx_#{stage}' index..."
    index(stage).delete
    puts "    'idx_#{stage}' index deleted!"
    @index = nil
  end

  private

  def self.client
    @client ||= IndexTank::Client.new(ENV['INDEXTANK_URL'])
  end

  def self.index(stage = 'stable')
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

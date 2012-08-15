# coding: utf-8
module Search
  module IndexTankWrapper

    class << self

      def search(*args)
        index.search(*args)
      end

      def batch_insert(*args)
        index.batch_insert(*args)
      end

    private

      def client
        @client ||= IndexTank::Client.new(ENV['HOUNDSLEUTH_URL'])
      end

      def index
        @index ||= client.indexes('idx')
      end

    end

  end
end

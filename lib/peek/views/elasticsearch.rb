require "stretch"

module Peek
  module Views
    class Elasticsearch < View
      def initialize options = {}
        @index = options.fetch(:index, nil)

        if defined?($stretch)
          @client = $stretch
        else
          raise "$stretch must be defined!"
        end
      end

      def status
        index_health["status"]
      end

      def active_primary_shards
        index_health["active_primary_shards"]
      end

      def active_replica_shards
        active_shards - active_primary_shards
      end

      def active_shards
        index_health["active_shards"]
      end

      def total_shards
        index_health["number_of_shards"]
      end

      def context
        {
          :primaries => active_primary_shards,
          :replicas  => active_replica_shards,
        }
      end

      def results
        {
          :active    => active_shards,
          :inactive  => (total_shards - active_shards),
          :status    => status
        }
      end

      private
      def index_health
        @index_health ||= @client.cluster.health(:indices => @index)["indices"][@index]
      end
    end
  end
end

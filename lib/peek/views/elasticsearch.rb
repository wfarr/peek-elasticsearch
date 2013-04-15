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

      def number_of_shards
        index_health["number_of_shards"]
      end

      def number_of_replicas
        index_health["number_of_replicas"] * number_of_shards
      end

      def context
        {
          :index            => @index,
          :primary          => active_primary_shards,
          :replica          => active_replica_shards,
          :inactive_primary => (number_of_shards - active_primary_shards),
          :inactive_replica => (number_of_replicas - active_replica_shards),
        }
      end

      def results
        { :status => status }
      end

      private
      def index_health
        @index_health ||= @client.cluster.health(:indices => @index)["indices"][@index]
      end
    end
  end
end

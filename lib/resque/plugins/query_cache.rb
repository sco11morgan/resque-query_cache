require "active_record"

module Resque
  module Plugins
    module QueryCache
      def around_perform_query_cache(*args)
        query_cache_enabled = ActiveRecord::Base.connection.query_cache_enabled
        connection_id = ActiveRecord::Base.connection_id
        ActiveRecord::Base.connection.enable_query_cache!

        yield if block_given?
      ensure
        ActiveRecord::Base.connection_id = connection_id
        ActiveRecord::Base.connection.clear_query_cache
        ActiveRecord::Base.connection.disable_query_cache! unless query_cache_enabled
      end      
    end
  end
end

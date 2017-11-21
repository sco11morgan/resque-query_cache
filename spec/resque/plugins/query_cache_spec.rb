class SomeJob
  include Resque::Plugins::QueryCache
end

RSpec.describe Resque::Plugins::QueryCache do
  it "has a version number" do
    expect(Resque::Plugins::QueryCache::VERSION).not_to be nil
  end

  it "keeps the original connection_id" do
    ActiveRecord::Base.connection
    original_connection_id = ActiveRecord::Base.connection_id
    SomeJob.new.around_perform_query_cache do
      ActiveRecord::Base.connection_id = rand(100000)
    end
    expect(ActiveRecord::Base.connection_id).to eq(original_connection_id)
  end

  context "#query_cache_enabled" do
    it "stays disabled if originally disabled" do
      ActiveRecord::Base.connection.disable_query_cache!
      SomeJob.new.around_perform_query_cache do
      end
      expect(ActiveRecord::Base.connection.query_cache_enabled).to eq(false)
    end

    it "stays enabled if originally enabled" do
      ActiveRecord::Base.connection.enable_query_cache!
      SomeJob.new.around_perform_query_cache do
      end
      expect(ActiveRecord::Base.connection.query_cache_enabled).to eq(true)
    end
  end
end

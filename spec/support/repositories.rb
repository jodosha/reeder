require 'lotus/model/adapters/memory_adapter'
adapter = Lotus::Model::Adapters::MemoryAdapter.new(Reeder.mapping)

Reeder::Repositories::FeedRepository.adapter    = adapter
Reeder::Repositories::ArticleRepository.adapter = adapter
Reeder.mapping.load!

Reeder::Repositories::FeedRepository.class_eval do
  def self.count_by_url(url)
    query do
      where(url: url)
    end.count
  end
end

Reeder::Repositories::ArticleRepository.class_eval do
  def self.last_by_feed(feed)
    query do
      where(feed_id: feed.id).
        desc(:id).
        limit(1)
    end.all.last
  end

  def self.count_by_guid(guid)
    query do
      where(guid: guid)
    end.count
  end
end

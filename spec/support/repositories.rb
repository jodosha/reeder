require 'reeder/migrator'

Reeder::Migrator.migrate!

Reeder::FeedRepository.class_eval do
  def self.count_by_url(url)
    query do
      where(url: url)
    end.count
  end
end

Reeder::ArticleRepository.class_eval do
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

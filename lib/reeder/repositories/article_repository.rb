require 'hanami/repository'

module Reeder
  class ArticleRepository
    include Hanami::Repository

    def self.persist(article)
      if f = by_guid(article.guid)
        article.id = f.id
        update(article)
      else
        create(article)
      end
    end

    def self.most_recent(limit = 10)
      preload_feeds query {
        desc(:id).limit(limit)
      }
    end

    private
    def self.by_guid(guid)
      query do
        where(guid: guid).
          limit(1)
      end.first
    end

    def self.preload_feeds(articles)
      articles.map do |article|
        article.feed = FeedRepository.find(article.feed_id)
        article
      end
    end
  end
end

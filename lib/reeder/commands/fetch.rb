require 'reeder/feed'
require 'reeder/article'
require 'reeder/repositories/feed_repository'
require 'reeder/repositories/article_repository'

module Reeder::Commands
  class Fetch
    def initialize(url)
      @url = url
    end

    def run
      persist fetch
    end

    private
    def fetch
      Reeder::Feed.new(url: @url).tap do |feed|
        feed.fetch!
      end
    end

    def persist(feed)
      persist_articles(
        persist_feed(feed)
      )
    end

    def persist_feed(feed)
      Reeder::Repositories::FeedRepository.persist(feed)
    end

    def persist_articles(feed)
      feed.articles.each do |article|
        Reeder::Repositories::ArticleRepository.persist(
          Reeder::Article.new(
            feed_id: feed.id,
            guid:    article.id,
            url:     article.url,
            title:   article.title
          )
        )
      end
    end
  end
end

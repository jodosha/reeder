require 'lotus/repository'

module Reeder
  class FeedRepository
    include Lotus::Repository

    def self.persist(feed)
      if f = by_url(feed.url)
        feed.id = f.id
        update(feed)
      else
        create(feed)
      end
    end

    private
    def self.by_url(url)
      query do
        where(url: url).
          limit(1)
      end.first
    end
  end
end

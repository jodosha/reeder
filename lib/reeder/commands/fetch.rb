require 'reeder/feed'
require 'reeder/repositories/feed_repository'

module Reeder::Commands
  class Fetch
    def initialize(url)
      @url = url
    end

    def run
      feed = Reeder::Feed.new(url: @url)
      feed.fetch!

      Reeder::Repositories::FeedRepository.persist(feed)
    end
  end
end

require 'reeder/repositories/feed_repository'

module Reeder::Commands
  class Update
    def run
      feeds.each do |feed|
        fetch(feed)
      end
    end

    private
    def feeds
      Reeder::Repositories::FeedRepository.all
    end

    def fetch(feed)
      Fetch.new(feed).run
    end
  end
end

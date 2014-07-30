require 'lotus/model/mapper'
require 'reeder/feed'
require 'reeder/article'
require 'reeder/repositories/feed_repository'
require 'reeder/repositories/article_repository'

module Reeder
  @@mapping = Lotus::Model::Mapper.new do
    collection :feeds do
      entity     Reeder::Feed
      repository Reeder::Repositories::FeedRepository

      attribute :id,    Integer
      attribute :url,   String
      attribute :title, String
    end

    collection :articles do
      entity     Reeder::Article
      repository Reeder::Repositories::ArticleRepository

      attribute :id,      Integer
      attribute :feed_id, Integer
      attribute :guid,    String
      attribute :url,     String
      attribute :title,   String
    end
  end

  def self.mapping
    @@mapping
  end
end

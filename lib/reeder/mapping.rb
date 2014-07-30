require 'lotus/model/mapper'
require 'reeder/feed'
require 'reeder/article'
require 'reeder/repositories/feed_repository'
require 'reeder/repositories/article_repository'
require 'lotus/model/adapters/sql_adapter'

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

  def self.load!
    ENV['DATABASE_URL'] ||= "sqlite://db/reeder-#{ ENV['LOTUS_ENV'] }.db"
    adapter = Lotus::Model::Adapters::SqlAdapter.new(mapping, ENV['DATABASE_URL'])

    Reeder::Repositories::FeedRepository.adapter    = adapter
    Reeder::Repositories::ArticleRepository.adapter = adapter

    mapping.load!
  end
end

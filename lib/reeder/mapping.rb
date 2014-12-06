require 'lotus/model'
require 'reeder/entities/feed'
require 'reeder/entities/article'
require 'reeder/repositories/feed_repository'
require 'reeder/repositories/article_repository'
require 'lotus/model/adapters/sql_adapter'

module Reeder
  @@mapping = ::Lotus::Model.configure do
    adapter type: :sql, uri: ENV['DATABASE_URL']

    mapping do
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

        attribute :id,       Integer
        attribute :feed_id,  Integer
        attribute :guid,     String
        attribute :url,      String
        attribute :title,    String
        attribute :author,   String
        attribute :summary,  String
      end
    end
  end

  def self.mapping
    @@mapping
  end

  def self.load!
    mapping.load!
  end
end

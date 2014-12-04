require 'lotus/model'
require 'reeder/entities/feed'
require 'reeder/entities/article'
require 'reeder/repositories/feed_repository'
require 'reeder/repositories/article_repository'
require 'lotus/model/adapters/sql_adapter'

module Reeder
  @@mapping = ::Lotus::Model.configure do
    adapter type: :sql, uri: ENV['DATABASE_URL']

    mapping 'lib/reeder/config/mapping'
  end

  def self.mapping
    @@mapping
  end

  def self.load!
    mapping.load!
  end
end

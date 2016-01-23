require 'hanami/entity'

module Reeder
  class Article
    include Hanami::Entity
    attributes :feed, :feed_id, :guid, :url, :title, :author, :summary
  end
end

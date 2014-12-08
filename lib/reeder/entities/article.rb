require 'lotus/entity'

module Reeder
  class Article
    include Lotus::Entity
    self.attributes = :feed, :feed_id, :guid, :url, :title, :author, :summary
  end
end

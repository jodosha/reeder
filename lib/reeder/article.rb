require 'lotus/entity'

class Reeder::Article
  include Lotus::Entity
  self.attributes = :feed, :feed_id, :guid, :url, :title, :author, :summary
end

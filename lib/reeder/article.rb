require 'lotus/entity'

class Reeder::Article
  include Lotus::Entity
  self.attributes = :feed_id, :guid, :url, :title
end

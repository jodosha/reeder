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
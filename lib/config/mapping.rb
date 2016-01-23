collection :feeds do
  entity     Reeder::Feed
  repository Reeder::FeedRepository

  attribute :id,    Integer
  attribute :url,   String
  attribute :title, String
end

collection :articles do
  entity     Reeder::Article
  repository Reeder::ArticleRepository

  attribute :id,       Integer
  attribute :feed_id,  Integer
  attribute :guid,     String
  attribute :url,      String
  attribute :title,    String
  attribute :author,   String
  attribute :summary,  String
end
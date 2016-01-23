Hanami::Model.migration do
  change do
    create_table :articles do
      primary_key :id
      foreign_key :feed_id, :feeds
      column :guid, String
      column :url, String
      column :title, String
      column :author, String
      column :summary, String
    end
  end
end

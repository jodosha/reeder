Hanami::Model.migration do
  change do
    create_table :feeds do
      primary_key :id
      column :url, String
      column :title, String
    end
  end
end

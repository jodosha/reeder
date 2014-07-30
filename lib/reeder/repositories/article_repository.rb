require 'lotus/repository'

module Reeder::Repositories
  class ArticleRepository
    include Lotus::Repository

    def self.persist(article)
      if f = by_guid(article.guid)
        article.id = f.id
        update(article)
      else
        create(article)
      end
    end

    def self.most_recent(limit = 10)
      query do
        desc(:id).limit(limit)
      end
    end

    private
    def self.by_guid(guid)
      query do
        where(guid: guid).
          limit(1)
      end.first
    end
  end
end

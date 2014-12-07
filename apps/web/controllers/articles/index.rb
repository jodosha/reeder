module Reeder::Controllers::Articles
  class Index
    include Reeder::Action
    expose :articles

    def call(params)
      @articles = Reeder::ArticleRepository.most_recent
    end
  end
end

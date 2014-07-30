module Reeder::Controllers::Home
  class Index
    include Reeder::Action
    expose :feeds, :articles

    def call(params)
      @feeds    = Reeder::Repositories::FeedRepository.all
      @articles = Reeder::Repositories::ArticleRepository.most_recent
    end
  end
end

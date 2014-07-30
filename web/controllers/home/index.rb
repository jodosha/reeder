module Reeder::Controllers::Home
  class Index
    include Reeder::Action
    expose :articles

    def call(params)
      @articles = Reeder::Repositories::ArticleRepository.most_recent
    end
  end
end

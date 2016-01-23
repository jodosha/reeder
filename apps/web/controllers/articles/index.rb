module Web::Controllers::Articles
  class Index
    include Web::Action
    expose :articles

    def call(params)
      @articles = Reeder::ArticleRepository.most_recent
    end
  end
end

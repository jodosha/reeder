module Web::Views::Articles
  class Index
    include Web::View

    def articles
      locals[:articles].map { |article| Web::ArticlePresenter.new(article) }
    end
  end
end

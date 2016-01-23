module Web
  class ArticlePresenter
    include Hanami::Presenter

    def author_name
      author || feed_title
    end

    def feed_title
      feed.title
    end

    def raw_summary
      _raw(@object.summary)
    end
  end
end

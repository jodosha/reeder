module Reeder
  class ArticlePresenter
    include Lotus::Presenter

    def author_name
      author || feed_title
    end

    def feed_title
      feed.title
    end

#     def summary
#       ::Rack::Utils.escape_html(super)
#     end
  end
end

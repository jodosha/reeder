module Reeder::Controllers::Home
  class Index
    include Reeder::Action
    expose :feeds

    def call(params)
      @feeds = Reeder::Repositories::FeedRepository.all
    end
  end
end

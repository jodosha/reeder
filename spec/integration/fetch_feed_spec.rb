require 'spec_helper'
require 'reeder/commands/fetch'

require 'lotus/model/mapper'
mapping = Lotus::Model::Mapper.new do
  collection :feeds do
    entity     Reeder::Feed
    repository Reeder::Repositories::FeedRepository

    attribute :id,    Integer
    attribute :url,   String
    attribute :title, String
  end

  collection :articles do
    entity     Reeder::Article
    repository Reeder::Repositories::ArticleRepository

    attribute :id,      Integer
    attribute :feed_id, Integer
    attribute :guid,    String
    attribute :url,     String
    attribute :title,   String
  end
end

require 'lotus/model/adapters/memory_adapter'
adapter = Lotus::Model::Adapters::MemoryAdapter.new(mapping)

Reeder::Repositories::FeedRepository.adapter    = adapter
Reeder::Repositories::ArticleRepository.adapter = adapter
mapping.load!


Reeder::Repositories::FeedRepository.class_eval do
  def self.count_by_url(url)
    query do
      where(url: url)
    end.count
  end
end

Reeder::Repositories::ArticleRepository.class_eval do
  def self.last_by_feed(feed)
    query do
      where(feed_id: feed.id).
        desc(:id).
        limit(1)
    end.all.last
  end

  def self.count_by_guid(guid)
    query do
      where(guid: guid)
    end.count
  end
end

describe 'Fetch feed', :vcr do
  before do
    @url     = 'http://thechangelog.com/feed/'
    @command = Reeder::Commands::Fetch.new(@url)
    @command.run
  end

  it 'stores feed informations' do
    feed = Reeder::Repositories::FeedRepository.by_url(@url)

    expect(feed.title).to eq('The Changelog')
    expect(feed.url).to   eq(@url)
  end

  it 'stores feed informations only once' do
    @command.run

    count = Reeder::Repositories::FeedRepository.count_by_url(@url)
    expect(count).to eq(1)
  end

  it 'stores articles' do
    feed    = Reeder::Repositories::FeedRepository.by_url(@url)
    article = Reeder::Repositories::ArticleRepository.last_by_feed(feed)

    expect(article.feed_id).to eq(feed.id)
    expect(article.title).to   eq('Can your favorite programming language score a g()(‘al’)?')
    expect(article.url).to     eq('http://thechangelog.com/can-your-favorite-programming-language-score-a-goal/?utm_source=rss&utm_medium=rss&utm_campaign=can-your-favorite-programming-language-score-a-goal')
    expect(article.guid).to    eq('http://thechangelog.com/?p=9288')
  end

  it 'stores articles once' do
    @command.run

    feed    = Reeder::Repositories::FeedRepository.by_url(@url)
    article = Reeder::Repositories::ArticleRepository.last_by_feed(feed)
    count   = Reeder::Repositories::ArticleRepository.count_by_guid(article.guid)

    expect(count).to eq(1)
  end

end

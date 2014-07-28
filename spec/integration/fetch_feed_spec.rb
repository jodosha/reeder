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
end

require 'lotus/model/adapters/memory_adapter'
adapter = Lotus::Model::Adapters::MemoryAdapter.new(mapping)

Reeder::Repositories::FeedRepository.adapter = adapter
mapping.load!


Reeder::Repositories::FeedRepository.class_eval do
  def self.count_by_url(url)
    query do
      where(url: url)
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
end

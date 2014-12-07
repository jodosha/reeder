require 'spec_helper'
require 'reeder/commands/update'

describe 'Update feeds', :vcr do
  before do
    feeds = [
      feed_50  = Reeder::Feed.new(url: 'http://feeds.feedburner.com/newsyc50'),
      feed_500 = Reeder::Feed.new(url: 'http://feeds.feedburner.com/newsyc500')
    ]

    feeds.each do |feed|
      Reeder::FeedRepository.persist(feed)
    end

    Reeder::Commands::Update.new.run

    @feed_50  = Reeder::FeedRepository.by_url(feed_50.url)
    @feed_500 = Reeder::FeedRepository.by_url(feed_500.url)
  end

  it 'stores informations for feeds' do
    expect(@feed_50.title).to  eq('Hacker News 50')
    expect(@feed_500.title).to eq('Hacker News 500')
  end

  it 'stores articles for feeds' do
    [ @feed_50, @feed_500 ].each do |feed|
      expect(Reeder::ArticleRepository.last_by_feed(feed)).to_not be_nil
    end
  end
end

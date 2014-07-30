require 'spec_helper'
require 'reeder/commands/fetch'

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
    expect(article.title).to_not be_nil
    expect(article.url).to_not   be_nil
    expect(article.guid).to_not  be_nil
  end

  it 'stores articles once' do
    @command.run

    feed    = Reeder::Repositories::FeedRepository.by_url(@url)
    article = Reeder::Repositories::ArticleRepository.last_by_feed(feed)
    count   = Reeder::Repositories::ArticleRepository.count_by_guid(article.guid)

    expect(count).to eq(1)
  end

end

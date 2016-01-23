require 'spec_helper'
require 'reeder/entities/feed'

describe 'fetch feed', :vcr do
  before do
    @url  = 'http://feeds.feedburner.com/newsyc100'
    @feed = Reeder::Feed.new(url: @url)

    @feed.fetch!
  end

  it "raises error when the given URL isn't valid" do
    expect { Reeder::Feed.new(url: 'spec/spec_helper.rb').fetch! }.to raise_error(ArgumentError)
  end

  it 'fetches remote feed informations' do
    expect(@feed.title).to    eq('Hacker News 100')
    expect(@feed.url).to      eq(@url)
    expect(@feed.articles).to be_any
  end

  it 'fetches articles informations' do
    article = @feed.articles.first

    expect(article.title).to eq('Dear Instagram (bolt.co)')
    expect(article.url).to   eq('https://blog.bolt.co/2014/07/28/dear-instagram')
    expect(article.id).to    eq('https://blog.bolt.co/2014/07/28/dear-instagram')
  end
end

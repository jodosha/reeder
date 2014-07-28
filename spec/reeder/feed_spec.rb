require 'spec_helper'
require 'reeder/feed'

describe 'Fetch feed', :vcr do
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

    expect(article.title).to eq('How recursion got into programming: a comedy of errors (wordpress.com)')
    expect(article.url).to   eq('http://vanemden.wordpress.com/2014/06/18/how-recursion-got-into-programming-a-comedy-of-errors-3/')
    expect(article.id).to    eq('http://vanemden.wordpress.com/2014/06/18/how-recursion-got-into-programming-a-comedy-of-errors-3/')
  end
end

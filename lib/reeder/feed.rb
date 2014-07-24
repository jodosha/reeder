require 'uri'
require 'open-uri'
require 'feedjira'

class Reeder::Feed
  attr_reader :url, :title, :articles

  def initialize(url)
    @url = url
  end

  def fetch!
    result    = parse(fetch)
    @title    = result.title
    @articles = result.entries
  end

  private
  def fetch
    open(valid_url).read
  end

  def parse(xml)
    Feedjira::Feed.parse(xml)
  end

  def valid_url
    URI.extract(url).first.tap do |u|
      raise ArgumentError.new("Invalid URL: #{ url }") if u.nil?
    end
  end
end

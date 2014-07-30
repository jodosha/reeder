require 'reeder/commands/fetch'

[
  'http://feeds.feedburner.com/newsyc100'
].each do |url|
  Reeder::Commands::Fetch.new(url).run
end


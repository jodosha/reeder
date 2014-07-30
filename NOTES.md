### 00-setup

1. Install gems with `bundle install --local`

### 01-rspec

1. Add rspec to the gemspec

2. run `rspec --init`

3. Remove `--warnings` from `.rspec`

4. Comment RSpec profiling

5. Add the following lines to `Rakefile`

```ruby
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec
```

6. Advanced RSpec configuration

7. Add vcr, webmock, capybara gems

### 02-fetch-feed

1. Spec remote feed informations ( http://feeds.feedburner.com/newsyc100 )

2. Spec fetch articles informations

3. Spec valid URI

### 03-store-feed

1. Move integration as feed unit test (spec/integration/fetch_feed_spec.rb => spec/feed_spec.rb)

2. Setup Lotus::Model via a trivial test (stores feed informations)

3. Test that a feed will only created once.

### 04-store-articles

1. Add tests to integration to check that the articles are persisted.

2. Setup ArticleRepository

3. Test that feed will created only once.

### 05-update-feeds

1. Extract Reeder.mapping

2. Extract everything under spec/support
  Dir[__dir__ + '/support/**/*.rb'].each {|f| require f }

3. Integration test: Update feeds ( spec/integration/update_feeds_spec.rb )
  feed_50  = Reeder::Feed.new(url: 'http://feeds.feedburner.com/newsyc50'),
  feed_500 = Reeder::Feed.new(url: 'http://feeds.feedburner.com/newsyc500')

4. Allow Fetch to accept both feed or url
  Reeder::Feed.fabricate

### 06-setup-lotus
  require_relative '../../web/application'

### 07-read-articles

1. Setup VCR (again)

2. Show feed titles on the home page sidebar

3. Show last 10 articles

### 08-persistence

1. Introduce Reeder.load! (works with mapping)

2. Introduce Reeder::Migrator

3. Introduce dotenv-deployment

### 09-server

1. Duplicate .env

2. Migration task

3. Seed task

4. config/environment.rb

5. config.ru

# Reeder

A simple feed reader built with [Hanami](http://hanamirb.org)

![Screenshot](https://github.com/jodosha/reeder/blob/master/screenshot.png)

## Requirements

  * Ruby 2+ (with Bundler)
  * SQLite 3

## Setup

Clone the repository and cd

```shell
% git clone https://github.com/jodosha/reeder.git && cd &_
```

Install the required gems

```shell
% bundle install
```

Run the tests

```shell
% RACK_ENV=test bundle exec hanami db create
% RACK_ENV=test bundle exec hanami db migrate
% bundle exec rake spec
```

## Run

Migrate and seed the database

```shell
% bundle exec hanami db create
% bundle exec hanami db migrate
```

Fetch articles:

```shell
% bundle exec rake db:seed
```

Run the server and visit `http://localhost:3000`

```shell
% bundle exec hanami server
```

## Explanation

This Hanami demo application was built on the first place for an [Eurucamp workshop](http://activities.eurucamp.org/activities/12).

## Contributing

1. Fork it ( https://github.com/jodosha/reeder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Acknowledgements

Thanks to the [Pure](http://purecss.io) team for their framework and their [layout](http://purecss.io/layouts/blog).

## Copyright

&copy; 2014 - 2016 [Luca Guidi](http://lucaguidi.com) - Released under the MIT license.

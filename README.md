# Reeder

A simple feed reader built with [Lotus](http://lotusrb.org)

![Screenshot](https://github.com/jodosha/reeder/blob/master/reeder.png)

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
% bundle
```

Run the tests

```shell
% bundle exec rake
```

## Run

Migrate and seed the database

```shell
% bundle exec rake db:seed
```

Run the server and visit `http://localhost:3000`

```shell
% bundle exec lotus server
```

## Explanation

This Lotus demo application was built on the first place for an [Eurucamp workshop](http://activities.eurucamp.org/activities/12).
It vendors the gems because the class may not have an internet connection.

As today (_Jul 30, 2014_), Lotus doesn't have code generators, that's why the code structure looks like a gem.
This repository shows how to develop an application starting from the pure business logic.
Step by step it adds persistence and then the web application.

## Contributing

1. Fork it ( https://github.com/jodosha/reeder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Acknowledgements

Thanks to the [Pure](http://purecss.io) team for their framework and their [layout](http://purecss.io/layouts/blog).

## Copyright

&copy; 2014 [Luca Guidi](http://lucaguidi.com) - Released under the MIT license.

ENV['RACK_ENV'] = ENV['LOTUS_ENV'] ||= 'development'
ENV['DATABASE_URL'] ||= 'sqlite://db/reeder_development.db' # Quickfix

require 'dotenv/deployment'
require 'reeder'

Reeder.load!

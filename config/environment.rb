ENV['RACK_ENV'] = ENV['LOTUS_ENV'] ||= 'development'
require 'dotenv/deployment'
require 'reeder'

Reeder.load!

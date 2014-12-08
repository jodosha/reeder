$:.unshift 'lib'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

require 'reeder/entities'
require 'reeder/repositories'

Lotus::Model.configure do
  adapter type: :sql, uri: ENV['DATABASE_URL']

  mapping "#{__dir__}/reeder/config/mapping"
end.load!

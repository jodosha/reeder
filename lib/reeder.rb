require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/reeder/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/reeder_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/reeder_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/reeder_development'
  #    adapter type: :sql, uri: 'mysql://localhost/reeder_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  mapping "#{__dir__}/config/mapping"
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/reeder/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!

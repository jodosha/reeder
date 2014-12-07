require_relative './config/applications'

Reeder::Container = Lotus::Router.new {
  mount Reeder::Web, at: '/'
}

run Reeder::Container

require_relative './environment'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Reeder::Web, at: '/'
end

require 'lotus'

module Reeder
  class Web < Lotus::Application
    configure do
      root __dir__

      routes 'config/routes'

      load_paths << [
        'controllers',
        'presenters',
        'views'
      ]

      layout    :application

      templates 'templates'

      serve_assets true
      assets << [
        'public'
      ]
    end
  end
end

require 'lotus'

module Reeder
  class Web < Lotus::Application
    configure do
      root __dir__

      routes do
        get '/', to: 'home#index', as: :home
      end

      load_paths << [
        'controllers',
        'views'
      ]

      layout    :application
      templates 'templates'
    end
  end
end

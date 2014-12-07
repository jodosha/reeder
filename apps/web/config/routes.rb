resources :articles, only: [:index]
get '/', to: 'articles#index', as: :home
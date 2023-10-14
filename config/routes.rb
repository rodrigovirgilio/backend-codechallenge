Rails.application.routes.draw do
  apipie
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: { format: 'json' }, constraints: { format: 'json' } do
    namespace :v1 do
      # returns API status
      # only used for tests atm
      get 'ping', to: 'ping#ping'
      resources :users, only: :create
    end
  end
end

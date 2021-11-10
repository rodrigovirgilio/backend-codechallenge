Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: { format: 'json' }, constraints: { format: 'json' } do
    namespace :v1 do
      # returns API status
      # only used for tests atm
      get 'ping', to: 'ping#ping'
    end
  end
end

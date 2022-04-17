Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      post '/gps', to: 'waypoints#gps'
    end
  end
  get '/show', to: 'api/v1/waypoints#show'
end

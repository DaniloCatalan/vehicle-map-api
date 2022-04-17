Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/gps', to: 'waypoints#gps'
    end
  end
  get '/show', to: 'api/v1/waypoints#show'
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'waypoints/index'
      get 'waypoints/show'
      post '/gps', to: 'waypoints#gps'
    end
  end
end

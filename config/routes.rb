Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, :games

      post '/login', to: 'auth#login'

      get '/auth', to: 'auth#get_user_from_token'

      get '/highscores', to: 'games#get_highscores'
    end
  end
end

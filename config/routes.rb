Rails.application.routes.draw do
  resources :movies
  resources :users
  # 1st name of the route,  then controller name and after# method
  get '/update_password', to: 'users#update_password'
  post '/auth', to: 'users#auth'
  get '/user_movies', to: 'users#user_movies'
  get '/user_info', to: 'users#user_info'
  get '/user_delete', to: 'users#user_delete'
  get '/movies_delete', to: 'movies#movie_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

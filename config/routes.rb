Rails.application.routes.draw do
  resources :movies
  resources :users
  # 1st name of the route,  then controller name and after# method
#  get 'users', to: 'users#index'
  post '/auth', to: 'users#auth'
  get '/new', to: 'new#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

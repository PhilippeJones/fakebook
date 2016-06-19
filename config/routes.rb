Rails.application.routes.draw do

  resources :users
  resources :posts do
    resources :comments
  end

  root 'posts#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  patch '/users' => 'posts#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

end

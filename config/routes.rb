Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :images do
  resources :likes
  end
  post "follow/user" => "users#follow_user", as: :follow_user
  get '/upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]

  get '/@:username', to: 'users#show', as: :profile
end

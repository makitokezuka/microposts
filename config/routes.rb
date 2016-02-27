Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'edit', to: 'users#edit'
  get 'users/:id/followers', to: 'users#followers', as:  'followers'
  get 'users/:id/followings', to: 'users#followings' , as: 'followings'
  post 'favorite', to: 'favorite_microposts#create', as: 'favorite'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end

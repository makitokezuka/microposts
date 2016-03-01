Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'edit', to: 'users#edit'
  get 'users/:id/followers', to: 'users#followers', as:  'followers'
  get 'users/:id/followings', to: 'users#followings' , as: 'followings'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :favorite_microposts, only: [:create, :destroy, :index]
end

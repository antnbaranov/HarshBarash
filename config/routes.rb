Rails.application.routes.draw do

  devise_for :users

  root 'posts#index'
  resources :posts, only: [:show, :index]
  resources :pictures, only: [:create, :destroy]
  resources :tags, only: [:show]

  namespace :admin do
    resources :posts, except: [:show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

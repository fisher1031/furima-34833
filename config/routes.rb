Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'items/index'
  root to: "items#index"
  resources :users, only: :new
  resources :items, only: [:index, :new, :create, :show]
end

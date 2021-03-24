Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'items/index'
  root to: "items#index"
  resources :users, only: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

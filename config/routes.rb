Rails.application.routes.draw do
  devise_for :users
  root to: "pantries#index"
  resources :pantries
  resources :users, only: [:show, :edit, :update]
end

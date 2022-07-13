Rails.application.routes.draw do
  devise_for :users
  root to: "pantries#index"
  resources :pantries do
    resources :foods
  end

  resources :users, only: [:show, :edit, :update]
end

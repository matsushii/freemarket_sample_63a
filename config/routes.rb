Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :logout
    end
    resources :cards
  end
end

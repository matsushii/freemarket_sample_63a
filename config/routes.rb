Rails.application.routes.draw do
  root to: "items#index"
  # resources :items, only: [:index, :show]
  get "items" => "items#show"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      get :pause
      get :resume
      get :search
    end
    resources :purchases, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :logout
      get :mypage
      get :identification
      get :deliver_address
      get :purchased_trading_items
      get :exhibit_items
    end
    resources :cards
  end

  get 'cards/new'
  
  resources :signup, only: [:index, :create] do
    collection do
      get  'step1'
      post 'step2'
      post 'step3' #入力が全て完了
      get  'complete' #登録完了後
    end
  end
end

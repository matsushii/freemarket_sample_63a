Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    member do
      get :pause
      get :resume
      get :search
      get :prefecture
    end
    collection do
      get :get_children, defaults: {format: 'json'}
      get :get_grandchildren, defaults: {format: 'json'}
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
      get :exhibit_items_trading
      get :exhibit_items_sold
    end
    resources :cards, only: [:new, :create]
  end

  resources :signup, only: [:index, :create] do
    collection do
      get  'step1' #ユーザー基本情報の入力
      get  'step2'
      post 'step2' #電話番号の入力（SMS認証は未実装）
      get  'step3'
      post 'step3' #入力が全て完了
      get  'step4' #payjpでカードを登録する
      post 'create_card' #payjpでカードを登録する
      get  'complete' #登録完了後
    end
  end
end

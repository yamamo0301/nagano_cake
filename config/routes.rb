Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  scope module: :public do
    resources :customers, only: [:show, :edit, :update]
      get 'customers/unsubscribe' => 'customers#unsubscribe'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
      delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy ]
    resources :orders, only: [:new, :index, :show, :create ]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/complete' => 'orders#complete'
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end

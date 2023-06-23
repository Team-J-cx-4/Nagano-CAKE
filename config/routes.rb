Rails.application.routes.draw do

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,
    skip: [:registrations, :passwords] ,
    controllers: {sessions: "admin/sessions"}

# public側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    get '/customers/quit', to: 'customers#quit'
    patch '/customers/out', to: 'customers#out'
    get '/orders/thanx', to: 'orders#thanx'
    post '/orders/log', to: 'orders#log'
    resources :items, only: [:show, :index]
    resources :orders, only: [:show, :new, :index, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :customers, only: [:show, :update, :edit]
    get '/customers/information', to: 'customers#show'
    get '/customers/information/edit', to: 'customers#edit'
    patch '/customers/information', to: 'customers#update'
    #resources :sessions, only: [:new, :create, :destroy]
    delete '/cart_items/all_destroy', to: 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy]
  end


# admin側ルーティング
  namespace :admin do
    get '' => 'homes#top'
    resources :items, only: [:new, :create, :show, :index, :update, :edit]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:edit, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:show, :index, :update, :edit]
    #resources :sessions, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

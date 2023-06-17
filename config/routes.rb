Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'home/about', to: 'homes#about'
  resources :items, :cart_items, :orders, :addresses, :genres, :customers, :order_details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

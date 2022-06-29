Rails.application.routes.draw do

	root 'items#home'
  resources :order_items
  devise_for :users
  resources :items
  get 'home', to: 'items#home'
  get 'search', to: 'items#search'
  get 'about', to: 'items#about'
  get 'cart', to: 'cart#show'
  get 'checkout', to: 'cart#checkout'

end


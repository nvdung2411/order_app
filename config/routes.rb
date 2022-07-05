Rails.application.routes.draw do

  root 'homepage#home'
  resources :order_items
  devise_for :users

  namespace :admin do
    resources :items
    get 'order', to: 'manage#order'
    get 'manage_user', to: 'manage#manage_user'
    get 'update_status/:id', to: 'manage#update_status', as: 'confirm_order'
  end

  resources :items, only: [:index, :show]
  get 'home', to: 'homepage#home'
  get 'search', to: 'items#search'
  get 'about', to: 'homepage#about'
  get 'cart', to: 'cart#show'
  get 'checkout', to: 'cart#checkout'
  get 'order', to: 'cart#order'
  get 'profile', to: 'user#profile'
  delete 'destroy', to: 'cart#destroy'
end

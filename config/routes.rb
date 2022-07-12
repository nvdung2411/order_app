Rails.application.routes.draw do

  root 'homepage#home'

  resources :order_items
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }

  namespace :admin do
    resources :items
    get 'order', to: 'manage#order'
    get 'manage_user', to: 'manage#manage_user'
    get 'confirm_order/:id', to: 'manage#confirm_order', as: 'confirm_order'
    get 'cancelled_order/:id', to: 'manage#cancelled_order', as: 'cancelled_order'
    delete 'destroy_user/:id', to: 'manage#destroy_user', as: 'destroy_user'
  end

  resources :items, only: [:index, :show]
  get 'home', to: 'homepage#home'
  get 'search', to: 'items#search'
  get 'about', to: 'homepage#about'
  get 'cart', to: 'cart#show'
  get 'checkout', to: 'cart#checkout'
  get 'order/:id', to: 'cart#order', as: 'order'
  get 'list_order', to: 'cart#list_order'
  get 'profile', to: 'user#profile'
  get 'update_status/:id', to: 'cart#update_status', as: 'update_status'
  delete 'order/destroy/:order_id', to: 'cart#destroy', as: 'delete_order'
end

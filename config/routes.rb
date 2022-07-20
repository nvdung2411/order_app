# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homepage#home'

  resources :order_items
  devise_for :users, controllers: {
    confirmations: 'confirmations',
    registrations: 'registrations',
    sessions: 'sessions'
  }

  namespace :admin do
    resources :items
    get 'order', to: 'manage#order'
    get 'manage_user', to: 'manage#manage_user'
    get 'cancel_multiple', to: 'manage#cancel_multiple', as: 'cancel_multiple'
    get 'confirm_multiple', to: 'manage#confirm_multiple', as: 'confirm_multiple'
    get 'confirm_order/:id', to: 'manage#confirm_order', as: 'confirm_order'
    get 'cancel_order/:id', to: 'manage#cancel_order', as: 'cancel_order'
    get 'confirm_all', to: 'manage#confirm_all', as: 'confirm_all'
    get 'dashboard', to: 'manage#dashboard', as: 'dashboard'
    delete 'destroy_user/:id', to: 'manage#destroy_user', as: 'destroy_user'
  end

  resources :items, only: %i[index show] do
    resources :reviews
  end
  get 'home', to: 'homepage#home'
  get 'search', to: 'items#search'
  get 'about', to: 'homepage#about'
  get 'cart', to: 'cart#show'
  get 'checkout', to: 'cart#checkout'
  get 'order/:id', to: 'cart#order', as: 'order'
  get 'list_order', to: 'cart#list_order'
  delete 'delete_all', to: 'cart#delete_all', as: 'delete_all'
  get 'profile', to: 'user#profile'
  get 'update_status/:id', to: 'cart#update_status', as: 'update_status'
  delete 'order/destroy/:order_id', to: 'cart#destroy', as: 'delete_order'
end

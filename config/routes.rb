Rails.application.routes.draw do
  root 'items#home'
  devise_for :users
  resources :items
  get 'home', to: 'items#home'
  get 'search', to: 'items#search'
  get 'about', to: 'items#about'
end


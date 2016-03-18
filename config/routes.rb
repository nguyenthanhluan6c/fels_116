Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users do
    resources :follows, only: [:index]
  end
  resources :categories, only: [:index] do
    resources :lessons, only: [:create, :show, :update]
  end
  resources :words, only: [:index]
  resources :relationships, only: [:create, :destroy]

  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy]
    resources :categories
  end
end

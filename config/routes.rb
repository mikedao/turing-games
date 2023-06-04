Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/dashboard", to: "dashboard#index"
    resources :campaigns
  end

  resources :campaigns, only: [:show] do
    resources :characters, except: [:index]
  end
  resources :campaign_users, only: [:create, :destroy]
end

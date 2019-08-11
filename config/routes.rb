Rails.application.routes.draw do
  get 'sessions/new'
  resources :gossips do
    resources :comments
    #resources :likes
  end

  resources :contact
  resources :team
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'gossips#index'
end

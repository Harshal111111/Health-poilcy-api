Rails.application.routes.draw do
  get 'sessions/create'
  devise_for :users
  resources :users, only: [:index, :show, :create]
  resources :health_policies, only: [:create]
  resources :documents, only: [:create]
  get 'user_details', to: 'users#details'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resources :health_policies, only: [:create]
  end
end

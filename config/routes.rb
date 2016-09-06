Rails.application.routes.draw do
  resources :events, only: [:new, :create, :show, :index]

  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :users, only: [:new, :create, :show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  #get 'search', to: 'players#index'
  
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:show, :new, :create] do
    member do
      resources :teams
    end
    
  end
  
  resources :players
  resources :favorites, only: [:create, :destroy]
  resources :members, only: [:create, :destroy]
end

Rails.application.routes.draw do

  resource :session, only: :create
  
  resources :users, except: [:edit, :new, :update] do 
    resources :events, only: [:new, :create, :show, :index] do
      resources :invitations, only: [:new, :create, :show]
    end
  end
  
  resources :events, only: [:new, :create, :show, :index]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'

  root 'events#index'

end

Rails.application.routes.draw do

  resource :session, only: :create
  resources :users, except: [:edit, :new, :update]
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:new, :create, :show]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'
  get 'invite' => 'invitations#new'



end

Rails.application.routes.draw do

  resource :session, only: [:create, :destroy, :new]
  resources :users, except: [:edit, :new, :update]

  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  
end

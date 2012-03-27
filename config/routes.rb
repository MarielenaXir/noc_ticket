NocTicket::Application.routes.draw do

  devise_for :users
  
  resources :gizmos
  resources :profile, :only => [:show]
  resources :work,    :only => [:show]
  
  resources :tickets, :only => [:new, :create, :show] do
    resources :histories, :only => [:create]
  end
  
  get "home/index"
  root :to => 'home#index'
end

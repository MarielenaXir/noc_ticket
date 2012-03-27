NocTicket::Application.routes.draw do
  get "home/index"

  devise_for :users
  resources :gizmos
  resources :profile, :only => [:show]
  resources :work,    :only => [:show]

  root :to => 'home#index'
end

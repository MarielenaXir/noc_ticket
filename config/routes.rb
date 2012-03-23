NocTicket::Application.routes.draw do
  get "home/index"

  devise_for :users
  resources :gizmos

  root :to => 'home#index'
end

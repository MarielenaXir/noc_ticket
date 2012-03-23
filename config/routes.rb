NocTicket::Application.routes.draw do
  devise_for :users

  resources :gizmos

  root :to => 'gizmos#index'
end

NocTicket::Application.routes.draw do
  resources :gizmos

  root :to => 'gizmos#index'
end

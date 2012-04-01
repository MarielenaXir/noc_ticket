NocTicket::Application.routes.draw do

  get "page/help"
  get "page/more"

  devise_for :users
  resources :profile, :only => [:show]
  resources :todos,   :only => [:show]
  
  resources :tickets, :only => [:new, :create, :show] do
    resources :histories, :only => [:create]
    post :assign
    get  :change_state
  end
  
  get "home/index"
  root :to => 'home#index'
end

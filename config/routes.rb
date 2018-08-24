Rails.application.routes.draw do
  resources :logs
  resources :expansions
  resources :games
  resources :players
  resources :designers
  resources :publishers
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

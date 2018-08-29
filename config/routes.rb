Rails.application.routes.draw do
  resources :dictionaries
  resources :categories
  get 'play/options', to: 'play#options'
  get 'play/game', to: 'play#game'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

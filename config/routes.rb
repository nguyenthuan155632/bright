Rails.application.routes.draw do
  root to: 'dictionaries#index'
  resources :dictionaries do
  	collection do
  		get 'search'
  	end
  end
  resources :histories, only: [:index]
  resources :categories
  resources :play, only: [:show] do
  	collection do
      get :options
  	  get :game
      get :result
      get :score
  	end
  end
end

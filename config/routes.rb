Rails.application.routes.draw do
  resources :dictionaries do
  	collection do
  		get 'search'
  	end
  end
  resources :categories
  resources :play, only: [:show] do
  	collection do
      get :options
  	  get :game
      get :result
      get :score
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

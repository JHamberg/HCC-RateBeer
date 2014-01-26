Ratebeer::Application.routes.draw do
  root 'breweries#index'

  # get 'kaikki_bisset', to: 'beers#index'
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]

  #get 'ratings', to: 'ratings#index'
  #get 'ratings/new', to:'ratings#new'

  #post 'ratings', to: 'ratings#create'
end

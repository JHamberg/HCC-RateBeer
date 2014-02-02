Ratebeer::Application.routes.draw do
  resources :memberships

  resources :beer_clubs

  resources :users

  root 'breweries#index'

  # get 'kaikki_bisset', to: 'beers#index'
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]
  resources :sessions, only: [:new, :create]
  resources :memberships, only: [:new, :create]

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  delete 'delaccount', to: 'users#destroy'


  #get 'ratings', to: 'ratings#index'
  #get 'ratings/new', to:'ratings#new'

  #post 'ratings', to: 'ratings#create'
end

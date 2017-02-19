Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'

  root to: 'games#new'
  resources :games, only: [:new, :create]
  resources :guesses
  resources :identifications do
    resources :guesses
  end
  resources :cohorts
  resources :people
end

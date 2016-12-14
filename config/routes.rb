Rails.application.routes.draw do
  root to: 'games#new'
  resources :games, only: [:new, :create]
  resources :guesses
  resources :identifications do
    resources :guesses
  end
  resources :cohorts
  resources :people
end

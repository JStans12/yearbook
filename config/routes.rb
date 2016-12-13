Rails.application.routes.draw do
  root to: "home#index"
  resources :guesses
  resources :identifications do
    resources :guesses
  end
  resources :cohorts
  resources :people
end

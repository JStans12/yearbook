Rails.application.routes.draw do
  resources :guesses
  resources :identifications do
    resources :guesses
  end
  resources :cohorts
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

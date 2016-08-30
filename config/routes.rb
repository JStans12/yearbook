Rails.application.routes.draw do
  resources :identifications
  resources :cohorts
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

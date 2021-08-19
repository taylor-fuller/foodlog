Rails.application.routes.draw do
  resources :meal_types
  root to: 'entries#index'
  resources :entries
  get '/diary', to: 'diary#index'
  get 'search', to: 'diary#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :meal_types
  get '/diary', to: 'diary#index'
  root to: 'entries#index'
  resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

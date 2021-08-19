Rails.application.routes.draw do
  resources :meal_types
  root to: 'diary#index'
  resources :entries
  resources :diary
  get 'diary?date=:year-:month-:day', to: 'diary#date'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

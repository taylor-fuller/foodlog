Rails.application.routes.draw do
  resources :foods
  root to: 'entries#index'
  resources :entries
  get '/diary', to: 'diary#index'
  get 'search', to: 'diary#search'

  resources :entries do
    resources :foods
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

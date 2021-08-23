Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
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

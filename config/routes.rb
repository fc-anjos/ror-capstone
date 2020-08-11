Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :categories, only: %i[show]
  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

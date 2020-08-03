Rails.application.routes.draw do
  get 'categories/show'
  get 'articles/index'
  devise_for :users
  resources :articles, only: %i[index show]
  resources :categories, only: %i[show]
  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

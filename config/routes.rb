Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :welcome, only: [:index]
  root 'welcome#index'
end

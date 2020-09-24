Rails.application.routes.draw do
  resources :reviews
  resources :categories
  resources :products
  resources :orders
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

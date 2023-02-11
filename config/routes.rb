Rails.application.routes.draw do
  resources :categories
  resources :products, only: [:index, :show, :create, :update, :destroy]
end

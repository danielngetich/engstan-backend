Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users', to: 'users#new'
  post 'users', to: 'users#create'
  delete 'users', to: 'users#logout'
  post 'products', to: 'products#create'
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]
    end
  end
end

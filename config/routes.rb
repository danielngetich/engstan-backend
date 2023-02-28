Rails.application.routes.draw do
  resources :users
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]
    end
  end
  resources :products do
    collection do
      get '/products/:type', to: 'products#index'
      get 'branded_products', to: 'products#branded_products'
    end
  end
end

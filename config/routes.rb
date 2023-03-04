Rails.application.routes.draw do
  get 'login', to: 'users#new'
  post 'login', to: 'users#create'
  delete 'logout', to: 'users#logout'
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]
    end
  end
end

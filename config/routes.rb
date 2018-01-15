Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  resources :users, only: [:index,:show,:update] , param: :name do
    collection do
      get :check_email
      get :check_name
    end
    member do
      get :following
      get :followers
    end
  end

  resources :tweets, only: [:index,:create]

  resources :follow_relationships, only: [:create] do
    collection do
      delete :destroy
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

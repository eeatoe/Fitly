Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      root 'home#index'

      resources :users, only: [:show, :update, :destroy]

      namespace :auth do
        resources :registrations, only: [:create]
        resources :sessions, only: [:create, :destroy]
        
        resources :passwords do
          collection do
            post :reset
            post :update
          end
        end
      end

      resources :exercises, only: [:index, :show]
      resources :user_workouts, only: [:index, :show]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

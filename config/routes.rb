Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "home#index"

      scope module: "user" do
        resources :users, only: [:show, :update, :destroy]
        resources :registrations, only: [:create]
        resources :sessions, only: [:create]

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

  get "up" => "rails/health#show", :as => :rails_health_check
end

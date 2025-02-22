Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "home#index"
      
      resources :users, only: [:show, :update, :destroy]

      namespace :auth do
        resource :registrations, only: [:create]
        resource :sessions, only: [:create, :destroy]
        
        resource :passwords, only: [] do
          collection do
            post :reset # Отправка ссылки на сброс пароля
            patch :update
          end
        end
      end

      resources :exercises, only: [:index, :show]
      resources :user_workouts, only: [:index, :show]
    end
  end

  get "up" => "rails/health#show", :as => :rails_health_check
end

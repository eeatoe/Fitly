Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "home#index"
      
      resources :users, only: [:show, :update, :destroy]

      namespace :auth do
        resource :registrations, only: [:create]
        resource :sessions, only: [:create, :destroy] # Выдача access токена
        post 'refresh', to: 'refresh_tokens#create' # Выдача refresh токена
        
        resource :passwords, only: [] do
          collection do
            post :reset # Отправка ссылки на сброс пароля
            patch :update
          end
        end
      end

      resources :workouts, only: [:index, :show, :create, :update, :destroy] do
        # Маршруты для добавления тренировки в избранное
        member do
          post :add_to_favorites
          delete :remove_from_favorites
        end

        # Страница для просмотра тренировок экспертов
        get 'expert', to: 'workouts#expert_index', as: 'expert'

        # Страница для просмотра только своих тренировок
        get 'my', to: 'workouts#my_index', as: 'my'
      end



      resources :exercises, only: [:index, :show]
      resources :user_workouts, only: [:index, :show]
    end
  end

  get "up" => "rails/health#show", :as => :rails_health_check
end

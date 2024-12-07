class Api::V1::User::RegistrationsController < Api::V1::ApplicationController
  skip_before_action :require_login, only: [:create] 
  # Указываем, что не нужно быть зарегистрированным для "create"

  # POST api/v1/registrations
  def create
    user = User.create(user_params)

    if user.save
      token = encode_auth_token(user_id: user.id)
      render json: {
        id: user.id,
        token: token
      }, status: :created # Сделай сериализацию
    else
      render json: { status: 422 }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :birth_date)
  end
end
class Api::V1::Auth::RegistrationsController < Api::V1::ApplicationController
  def create
    result = Auth::RegistrationService.new(user_params).call

    if result.success?
      token = encode_auth_token(user_id: result.user.id)
      render json: { user: result.user, token: token }, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :birth_date)
  end
end
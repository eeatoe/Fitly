class Api::V1::Auth::RegistrationsController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!
  def create
    result = Auth::RegistrationService.new(user_params).call

    if result.success?
      render json: { 
        user: result.user, 
        access_token: result.access_token,
        refresh_token: result.refresh_token
        }, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :birth_date)
  end
end
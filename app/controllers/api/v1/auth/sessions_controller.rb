class Api::V1::Auth::SessionsController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  
  def create
    result = Auth::LoginService.new(login_params).call

    if result.success?
      render json: {
        user: result.user,
        access_token: result.access_token,
        refresh_token: result.refresh_token
      }, status: :ok
    else
      render json: { errors: result.errors }, status: :unauthorized
    end
  end

  def destroy
    current_user.update!(refresh_token: nil, refresh_token_expires_at: nil)
    render json: { message: I18n.t('auth.success.logout') }, status: :ok
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end

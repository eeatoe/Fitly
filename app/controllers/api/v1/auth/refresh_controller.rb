class Api::V1::Auth::RefreshController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!
  
  def create
    refresh_token = params[:refresh_token]
    user = User.find_by(refresh_token: refresh_token)

    if user && user.refresh_token_expires_at > Time.current
      new_access_token = encode_auth_token(user_id: user.id)
      new_refresh_token = Auth::RefreshTokenService.call(user)

      render json: { 
        access_token: new_access_token,
        refresh_token: new_refresh_token
      }, status: :ok
    else
      render json: { errors: ['Invalid or expired refresh token'] }, status: :unauthorized
    end
  end

  private

  def generate_refresh_token(user)
    token = SecureRandom.hex(32)
    user.update!(refresh_token: token, refresh_token_expires_at: 30.days.from_now)
    token
  end
end
class Api::V1::Auth::RefreshTokensController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!
  
  def create
    user = User.find_by(refresh_token: params[:refresh_token])

    if user && user.refresh_token_expires_at > Time.current
      new_access_token = encode_auth_token(user_id: user.id)
      new_refresh_token = Auth::RefreshTokenService.call(user, response)

      render json: { 
        access_token: new_access_token,
        refresh_token: new_refresh_token
      }, status: :ok
    else
      render json: { errors: ['auth.errors.refresh_token.invalid_refresh_token'] }, status: :unauthorized
    end
  end
end
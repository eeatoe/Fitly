class Api::V1::ApplicationController < ApplicationController
  before_action :authenticate_user!

  include JwtAuthenticatable

  private

  def current_user
    @current_user ||= User.find_by(id: decoded_auth_token&.dig(:user_id))
  end

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    decoded = decoded_auth_token(token)

    if decoded && decoded[:exp] > Time.now.to_i
      @current_user = User.find_by(id: decoded[:user_id])
    else
      render json: { errors: [(I18n.t 'auth.errors.access_token.expired_jwt_signature')] }, status: :unauthorized
    end
  end
end
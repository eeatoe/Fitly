class Api::V1::ApplicationController < ApplicationController
  respond_to :json

  include JwtAuthenticatable

  skip_before_action :verify_authenticity_token
  before_action :require_login

  private

  def logged_in?
    !!current_user
  end

  def current_user # перенести в user
    return @current_user if @current_user

    if decoded_auth_token
      user_id = decoded_auth_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
  end

  # Этот метод будет вызываться перед каждым запросом, требующим аутентификации
  def require_login
    unless current_user
      render json: { message: 'Please log in.' }, status: :unauthorized
    end
  end
end
module JwtAuthenticatable
  extend ActiveSupport::Concern

  def encode_auth_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key) 
  end

  def decoded_auth_token
    header = request.headers['Authorization']
    
    token = header.split(' ').last
    JWT.decode(token, Rails.application.credentials.jwt_secret_key)
  rescue JWT::ExpiredSignature
    nil
  rescue JWT::DecodeError, JWT::VerificationError
    nil
  end
end
module JwtAuthenticatable
  extend ActiveSupport::Concern

  def encode_auth_token(payload, exp = 24.hours.from_now)
    Auth::AccessJwtTokenService.encode(payload, exp)
  end
    
  def decoded_auth_token
    token = request.headers['Authorization']&.split(' ')&.last
    return nil unless token

    Auth::AccessJwtTokenService.decode(token)
  end
end

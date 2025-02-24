class Auth::AccessJwtTokenService
  SECRET_KEY = Rails.application.credentials.jwt_secret_key

  def self.encode(payload, exp)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    decoded_data = HashWithIndifferentAccess.new(decoded)
    ServiceResult.success(decoded_data)
  rescue JWT::ExpiredSignature
    ServiceResult.failure([I18n.t('auth.errors.access_token.expired_jwt_signature')])
  rescue JWT::DecodeError, JWT::VerificationError
    ServiceResult.failure([I18n.t('auth.errors.access_token.invalid_jwt_token', error: e.message)])
  end
end
class Auth::LoginService
  attr_reader :params
  
  def initialize(params)
    @params = params
  end

  def call
    user = User.find_by(email: @params[:email])
    return ServiceResult.failure([I18n.t('auth.errors.access_token.invalid_credentials')]) unless user&.authenticate(@params[:password])

    access_token = Auth::AccessJwtTokenService.encode(user_id: user.id)
    refresh_token = Auth::RefreshTokenService.call(user)

    ServiceResult.success({ user: user, access_token: access_token, refresh_token: refresh_token })
  end
end

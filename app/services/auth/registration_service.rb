class Auth::RegistrationService
  attr_reader :params
  
  def initialize(params)
    @params = params
  end

  def call
    user = User.new(@params)

    if user.save
      access_token = Auth::AccessJwtTokenService.encode(user_id: user.id)
      refresh_token = Auth::RefreshTokenService.call(user)
      ServiceResult.success({ user: user, access_token: access_token, refresh_token: refresh_token })
    else
      ServiceResult.failure(user.errors.full_messages)
    end
  end
end

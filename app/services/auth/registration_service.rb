class Auth::RegistrationService
  def initialize(params)
    @params = params
  end

  def call
    user = User.new(@params)

    if user.save
      access_token = Auth::JwtAccessTokenService.encode(user_id: user.id)
      refresh_token = Auth::RefreshTokenService.call(user)
      Success.new(user, access_token, refresh_token)
    else
      Failure.new(user.errors.full_messages)
    end
  end

  private

  attr_reader :params

  class Success
    attr_reader :user, :access_token, :refresh_token
    def initialize(user, access_token, refresh_token); @user = user; end
    def success?; true; end
  end

  class Failure
    attr_reader :errors
    def initialize(errors); @errors = errors; end
    def success?; false; end
  end
end

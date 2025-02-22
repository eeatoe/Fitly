class Auth::LoginService
  def initialize(params)
    @params = params
  end

  def call
    user = User.find_by(email: @params[:email])
    return Failure.new(['Invalid credentials']) unless user&.authenticate(@params[:password])

    access_token = Auth::JwtAccessTokenService.encode(user_id: user.id)
    refresh_token = Auth::RefreshTokenService.call(user)

    Success.new(user, access_token, refresh_token)
  end

  private

  attr_reader :params

  class Success
    attr_reader :user, :access_token, :refresh_token
    def initialize(user, access_token, refresh_token)
      @user = user
      @access_token = access_token
      @refresh_token = refresh_token
    end
    def success?; true; end
  end

  class Failure
    attr_reader :errors
    def initialize(errors); @errors = errors; end
    def success?; false; end
  end
end
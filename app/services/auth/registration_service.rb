class Auth::RegistrationService
  def initialize(params)
    @params = params
  end

  def call
    user = User.new(@params)

    if user.save
      Success.new(user)
    else
      Failure.new(user.errors.full_messages)
    end
  end

  private

  attr_reader :params

  class Success
    attr_reader :user
    def initialize(user); @user = user; end
    def success?; true; end
  end

  class Failure
    attr_reader :errors
    def initialize(errors); @errors = errors; end
    def success?; false; end
  end
end

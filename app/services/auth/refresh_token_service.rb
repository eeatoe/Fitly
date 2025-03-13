class Auth::RefreshTokenService
  def self.call(user, response = nil)
    token = SecureRandom.hex(32)
    
    if user.update(refresh_token: token, refresh_token_expires_at: 30.days.from_now)
      response.set_header('Refresh-Token', token) if response
      ServiceResult.success(token)
    else
      ServiceResult.failure(user.errors.full_messages)
    end
  end
end

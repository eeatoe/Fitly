class Auth::RefreshTokenService
  def self.call(user)
    token = SecureRandom.hex(32)
    user.update!(refresh_token: token, refresh_token_expires_at: 30.days.from_now)
    token
  end
end

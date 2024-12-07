class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  def self.encode(payload, exp = 3.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decode = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decode)
  rescue JWT::ExpiredSignature
    nil # Токен истек
  rescue
    nil # Любая другая ошибка
  end
end

# Этот сервис будет отвечать за кодирование и декодирование JWT токенов.
class PasswordValidator < ActiveModel::Validator
  def validate(record)
    if record.password.blank?
      record.errors.add(:password, "не может быть пустым")
    elsif record.password.length < 6
      record.errors.add(:password, "должен содержать не менее 6 символов")
    elsif record.password.length > 64
      record.errors.add(:password, "должен содержать не более 64 символов")
    elsif record.password !~ /(?=.*[a-z])/
      record.errors.add(:password, "должен содержать хотя бы одну строчную букву")
    elsif record.password !~ /(?=.*[A-Z])/
      record.errors.add(:password, "должен содержать хотя бы одну заглавную букву")
    elsif record.password !~ /(?=.*\d)/
      record.errors.add(:password, "должен содержать хотя бы одну цифру")
    elsif record.password =~ /(.)\1{2,}/
      record.errors.add(:password, "не может содержать три и более повторяющихся символа")
    end
  end
end
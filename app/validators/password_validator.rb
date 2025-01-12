class PasswordValidator < ActiveModel::Validator
  def validate(record)
    if record.password.blank?
      record.errors.add(:password, "can't be blank")
    elsif record.password.length < 6
      record.errors.add(:password, "must be at least 6 characters long")
    elsif record.password.length > 64
      record.errors.add(:password, "must be no more than 64 characters long")
    elsif record.password !~ /(?=.*[a-z])/
      record.errors.add(:password, "must contain at least one lowercase letter")
    elsif record.password !~ /(?=.*[A-Z])/
      record.errors.add(:password, "must contain at least one uppercase letter")
    elsif record.password !~ /(?=.*\d)/
      record.errors.add(:password, "must contain at least one digit")
    elsif record.password =~ /(.)\1{2,}/
      record.errors.add(:password, "can't contain three or more consecutive repeating characters")
    end
  end
end
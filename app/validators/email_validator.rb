class EmailValidator < ActiveModel::Validator
  def validate(record)
    email = record.email

    if email.blank?
      record.errors.add(:email, "can't be blank")
    end

    if User.exists?(email: email)
      record.errors.add(:email, "has already been taken")
    end

    unless ValidEmail2::Address.new(email).valid?
      record.errors.add(:email, "is invalid")
    end

    if ValidEmail2::Address.new(email).disposable?
      record.errors.add(:email, "can't be a disposable email address")
    end
  end
end
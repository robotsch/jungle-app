class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }
  has_secure_password

  def authenticate_with_credentials (email, password)
    if (self.authenticate(password))
      return self
    end
    return nil
  end
end

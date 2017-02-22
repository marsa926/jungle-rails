class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  validates :email, presence: true, confirmation: true, uniqueness: { case_sensitive: false }
  validates :email_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true, length: {minimum: 4}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
      if user && user.authenticate(password)
        return user
      else
        return nil
       end
  end
end


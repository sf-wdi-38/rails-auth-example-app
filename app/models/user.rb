class User < ApplicationRecord
  # validate that username is unique  (can add in User model)
  # validate against other criteria for user names (can't have a one-letter username, language filter)
  validates :name, presence: true, uniqueness: true, length: { minimum:2 }
  # create obscured version of password with BCrypt::Password.create
  has_secure_password
end

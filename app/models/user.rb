class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: true
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 8 }

  before_save { self.email = email.downcase }

  has_secure_password
end

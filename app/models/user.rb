class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy
end

class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :gossips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :password_digest, presence: true, length: {minimum: 6}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end

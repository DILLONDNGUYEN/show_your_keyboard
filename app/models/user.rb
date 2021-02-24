class User < ActiveRecord::Base
  has_secure_password
  has_many :images
  has_many :keycaps
  has_many :switches

  validates :username, presence: true, uniqueness: true, length: { minimum: 2}, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "cannot contain blank spaces or symbols" }
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: ->(u){ u.password.blank? }


end
class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :likes
validates :name, :alias,presence: true, length: {minimum: 2}
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: {on: :create}, length: {minimum: 8, allow_blank: true}
end

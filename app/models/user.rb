class User < ActiveRecord::Base

  has_many :gadgets, dependent: :destroy

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :email, presence: true
  validates :email, format: {with: VALID_EMAIL_REGEX}
  validates_uniqueness_of :email, {case_sensitive: false}
  validates_length_of :password, {minimum: 5}

end
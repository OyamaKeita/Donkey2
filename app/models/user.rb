class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: VALID_EMAIL_REGEX }
  validates :password,
  length: { in: 8..32 },
  format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ }

  has_secure_password
  has_many :topics
  has_many :comments
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end

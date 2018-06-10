class User < ApplicationRecord
  validates :name, presence: true, 
            length: {minimum: 2, maximum:25}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            length: {maximum:100}, format: { with: VALID_EMAIL_REGEX}
end
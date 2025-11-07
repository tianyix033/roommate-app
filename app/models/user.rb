class User < ApplicationRecord
  has_many :listings

  validates :email, presence: true
  validates :password, presence: true
end

class Listing < ApplicationRecord
  belongs_to :user, optional: true 

  validates :title, :price, :city, :status, presence: true

  validates :price, numericality: { greater_than: 0 }
end

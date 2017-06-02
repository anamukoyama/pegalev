class Market < ApplicationRecord
  geocoded_by :address
  has_many :stalls
  has_many :sellers, through: :stalls
  after_validation :geocode, if: :address_changed?
  # validates :street_number, presence: true
end

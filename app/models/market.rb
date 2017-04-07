class Market < ApplicationRecord
  geocoded_by :address
  has_many :stalls
  has_many :farmers, through: :stalls
  after_validation :geocode, if: :address_changed?
end

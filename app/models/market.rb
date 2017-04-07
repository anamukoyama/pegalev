class Market < ApplicationRecord
  geocoded_by :address
  has_many :stalls
  after_validation :geocode, if: :address_changed?
end

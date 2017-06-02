class Market < ApplicationRecord
  geocoded_by :address
  has_many :stalls
  has_many :sellers, through: :stalls
  after_validation :geocode, if: :address_changed?

  attr_accessor :city_user, :state_user, :street_user, :number_user, :complement_user
  validates :city_user, :state_user, :street_user, :number_user, presence: true
end

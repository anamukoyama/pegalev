class Market < ApplicationRecord
  before_save :geocode_the_start_address
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def generate_full_adress

  end
end

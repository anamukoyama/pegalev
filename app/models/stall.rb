class Stall < ApplicationRecord
  belongs_to :seller
  belongs_to :market
  has_many :orders
end

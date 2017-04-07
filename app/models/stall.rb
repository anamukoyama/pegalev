class Stall < ApplicationRecord
  belongs_to :farmer
  belongs_to :market
  has_many :orders
  has_many :farmer_products
  has_many :products, through: :farmer_products
end

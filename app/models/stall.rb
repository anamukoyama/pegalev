class Stall < ApplicationRecord
  belongs_to :seller
  belongs_to :market
  has_many :orders
  has_many :seller_products
  has_many :products, through: :seller_products
end

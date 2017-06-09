class Seller < ApplicationRecord
  has_many :stalls
  has_many :markets, through: :stalls
  has_many :seller_products
  has_many :products, through: :seller_products
  has_and_belongs_to_many :delivery_times
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

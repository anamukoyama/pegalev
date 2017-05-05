class Seller < ApplicationRecord
  has_many :stalls
  has_many :markets, through: :stalls
  has_many :seller_products
  has_many :products, through: :seller_products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#para o active_admin
  def name
    "#{id} -- #{email}"
  end
end

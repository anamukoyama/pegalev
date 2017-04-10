class Product < ApplicationRecord
  CATEGORIES = %w(Frutas Legumes Verduras)
  mount_uploader :photo, PhotoUploader
  has_many :seller_products
  has_many :sellers, through: :seller_products
  has_many :order_items
  has_many :orders, through: :order_items
end

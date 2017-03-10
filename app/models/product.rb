class Product < ApplicationRecord
  CATEGORIES = %w(Frutas Legumes Verduras)
  mount_uploader :photo, PhotoUploader
end

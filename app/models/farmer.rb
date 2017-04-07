class Farmer < ApplicationRecord
  has_many :stalls
  has_many :farmer_products
  has_many :markets, through: :stalls
  has_many :orders, through: :stalls
  has_many :products, through: :farmer_products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

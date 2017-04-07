class Farmer < ApplicationRecord
  has_many :stalls
  has_many :markets, through: :stalls
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

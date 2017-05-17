class Order < ApplicationRecord
  belongs_to :user
  belongs_to :stall
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :order_status

  before_save :update_total
  before_create :set_order_status

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity.to_i }.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_total
    self.total = calculate_total
  end
end

class OverviewController < ApplicationController
  def index
  end

  def my_orders
  #  @my_orders = current_seller.orders
  end

  def my_products
   @my_products = current_seller.seller_products
   @products = Product.all
  end

  def my_stalls
  #  @my_stalls = current_seller.markets
  end
end

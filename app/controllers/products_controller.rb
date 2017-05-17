class ProductsController < ApplicationController

  def show
    sellers = sellers(params["sellers"])
    # escolhe um vendedor apenas da lista 'sellers', caso haja mais de um
    random_seller = sellers.sample
    market  = Market.find(params["market_id"].to_i)
    @stall = Stall.where(seller_id: random_seller.id, market_id: market.id).first
    @product = Product.find(params[:id])

    # When a user submits the form, a new order_item will be instantiated inside of current_order, so it will be available to the create route in order_Items_controller.rb.
    @order_item = current_order.order_items.new
  end

  private

  # recebe os um array com os id's dos feirantes deste produto especifico
  # e devolve um array com as suas referencias do banco de dados
  def sellers(ids)
    list_sellers = []
    ids.each do |id|
      list_sellers << Seller.find(id)
    end
    list_sellers
  end
end

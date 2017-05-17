class ProductsController < ApplicationController

  def show
    @sellers = sellers(params["sellers"])
    @random_seller = @sellers.sample
    @product = Product.find(params[:id])
    @market  = Market.find(params["market_id"].to_i)
    # When a user submits the form, a new order_item will be instantiated inside of current_order, so it will be available to the create route in order_Items_controller.rb.
    @order_item = current_order.order_items.new
  end

  def add_to_bascket
    # stall = Stall.where(seller_id: params["seller"], market_id: params["market_id"].to_i).first
    user_verification
    # Order.new(user_id: current_user.id, stall_id: stall.id )
    # flash 'produto adicionado com sucesso!'
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

  def user_verification
    if current_user == nil
      redirect_to new_user_session_path
    end
  end

  # def product_params
  #  params.require(:product).permit(:name, :price, :category, :best_before, :photo, :photo_cache)
  # end
end

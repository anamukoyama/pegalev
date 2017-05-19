class OrderItemsController < ApplicationController
  def create
    # esta ordem é a ordem corrente que pode ser a já criada ou é criada uma nova
    @order = current_order
    @order.stall_id = order_params["stall_id"].to_i
    # passando os parâmetros desta ordem
    @item = @order.order_items.new(quantity: order_params["quantity"].to_i, product_id: order_params["product_id"].to_i)
    @order.save
    @item.unit_price = @item.product.price
    # salva aquela ordem no cookie
    session[:order_id] = @order.id
    market = Stall.find(order_params["stall_id"].to_i).market
    redirect_to market_path(market)
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private
  def order_params
    params.require(:order_item).permit(:quantity, :product_id, :stall_id)
  end
end

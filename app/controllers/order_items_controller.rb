class OrderItemsController < ApplicationController
  def create
    # esta ordem é a ordem corrente que pode ser a já criada ou é criada uma nova
    @order = current_order
    # passando os parâmetros desta ordem
    @order_item = @order.OrderItem.new(order_item_params)
    @order.save
    # salva aquela ordem no cookie
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.OrderItem.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end

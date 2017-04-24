class OverviewController < ApplicationController
  def index
  end

  def my_orders
  # @my_orders = current_seller.orders
  end

# products -----------------------------------------------------

  def my_products
    @add_product = SellerProduct.new
    @my_products = current_seller.products
    @products    = products_to_add(Product.all)
  end

  def create_product
    product = Product.find(product_params['product_id'])
    @product = SellerProduct.new(seller_id: current_seller.id, product_id: product.id, price: product.price.to_i)
    if @product.save
      flash[:notice] = "Um novo produto foi adicionado"
      redirect_to my_products_path
    else
      render :new
    end
  end

  def destroy_product
    # deletando associação entre seller e o produto de sua lista
    @seller_product_association = SellerProduct.where(product_id: product_params['product_id'].to_i, seller_id: current_seller.id).first
    @seller_product_association.destroy
    redirect_to my_products_path
  end

# stalls ------------------------------------------------------

  def my_stalls
    @add_stall = Stall.new
    @my_stalls = current_seller.markets
    @markets   = markets_to_add(Market.all)
  end

  def create_stall
    stall  = Market.find(stall_params['market_id'])
    @stall = Stall.new(seller_id: current_seller.id, market_id: stall.id.to_i)
    @stall.save
    redirect_to my_stalls_path
  end

  def destroy_stall
    @seller_stall_association = Stall.where(market_id: stall_params['market_id'].to_i, seller_id: current_seller.id).first
    @seller_stall_association.destroy
    redirect_to my_stalls_path
  end

  private

  # exibe todos os produtos que o vendedor ainda não adicionou da lista

  def products_to_add(all)
    products = all.select do |p|
      if current_seller.products.include?(p)
        p = nil
      else
        p = p
      end
    end
  end

  def markets_to_add(all)
    stalls = all.select do |m|
      if current_seller.markets.include?(m)
        m = nil
      else
        m = m
      end
    end
  end

  def product_params
    params.require(:seller_product).permit(:product_id)
  end

  def stall_params
    params.require(:stall).permit(:market_id)
  end
end

class OverviewController < ApplicationController
  def index
  end

  def my_orders
  #  @my_orders = current_seller.orders
  end

  def my_products
   @add_product = SellerProduct.new
   @my_products = current_seller.products
   @products = remain_to_add(Product.all)
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
    @seller_product_association = SellerProduct.where(product_id: product_params['product_id'].to_i, seller_id: current_seller.id).first
    @seller_product_association.destroy
    redirect_to my_products_path
  end

  def my_stalls
  #  @my_stalls = current_seller.markets
  end

  private

  def remain_to_add(all)
    products = all.select do |p|
      if current_seller.products.include?(p)
        p = nil
      else
        p = p
      end
    end
  end

  def product_params
    params.require(:seller_product).permit(:product_id)
  end
end

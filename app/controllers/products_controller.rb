class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end
end

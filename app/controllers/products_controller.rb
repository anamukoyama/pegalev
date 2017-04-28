class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.name = @product.name.capitalize
    if @product.save
      flash[:notice] = "Produto adicionado com sucesso"
      redirect_to products_path
    else
        render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :category, :best_before, :photo, :photo_cache)
  end
end

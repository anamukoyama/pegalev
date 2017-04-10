class StallsController < ApplicationController
  skip_before_action :authenticate_seller!
  def index
    @stalls = Stall.all
  end

  def new
    @stall = Stall.new
  end

  def create
    @stall = Stall.new(stall_params)
    if @product.save
      flash[:notice] = "Produto adicionado com sucesso"
      redirect_to product_path(@product)
    else
        render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

private

  def set_stall
    @stall = Stall.find(params[:id])
  end
end

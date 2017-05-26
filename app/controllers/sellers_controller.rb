class SellersController < ApplicationController
before_action :set_seller

  def show
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      redirect_to seller_path
    else
      render :edit
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name, :email, :address, :complement, :zipcode, :number, :city, :state, :mobile)
  end

end

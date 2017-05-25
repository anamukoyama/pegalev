class SellersController < ApplicationController
before_action :set_seller

  def show
  end

  def edit
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name, :email, :address, :complement, :zipcode, :number, :city, :state, :mobile)
  end

end

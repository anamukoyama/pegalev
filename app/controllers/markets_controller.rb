class MarketsController < ApplicationController
  before_action :set_market, only: [:show]

  def index
    # @markets = Market.all

    @markets = Market.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@markets) do |market, marker|
      marker.lat market.latitude
      marker.lng market.longitude
    end

  end

  def show
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      flash[:notice] = "Feira criada com sucesso"
      redirect_to market_path(@market)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @market.destroy
    redirect_to markets_path
  end

  private

  def set_market
    @market = Market.find(params[:id])
  end

  def market_params
     params.require(:market).permit(:address, :inscription, :name, :weekday, :latitude, :longitude)
  end

end

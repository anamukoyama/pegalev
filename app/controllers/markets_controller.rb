class MarketsController < ApplicationController

  def search
    @markets = Market.all
    if params[:search_by_cep].present?
      @markets = @markets.near(params[:search_by_cep], 1)
    end

    @markets = @markets.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@markets) do |market, marker|
      marker.lat market.latitude
      marker.lng market.longitude
    end

    # @market_coordinates = []
    # @markets.each do |market|
    #   @market_coordinates << { lat: market.latitude, lng: market.longitude }
    # end
  end

  def show
    @market = Market.find(params[:id])
  end

  private

  def market_params
     params.require(:market).permit(:address, :inscription, :name, :weekday, :latitude, :longitude)
  end

end

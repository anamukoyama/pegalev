class MarketsController < ApplicationController
  before_action :set_date, only: [:show, :search]

  def search
    @markets = Market.all
    if params[:search_by_cep].present?
      @markets = @markets.near(params[:search_by_cep], 1)
    end
    if @markets.empty?
      flash[:notice] = "Não existem feiras próximas a este cep"
      redirect_to root_path
    end

    @markets = @markets.where.not(latitude: nil, longitude: nil, weekday: @today)
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

  def set_date
    @today = Date.new.strftime('%A')
    if @today == "Monday"
      @today = "SEGUNDA-FEIRA"
    elsif @today == "Tuesday"
      @today = "TERCA-FEIRA"
    elsif @today == "Wednesday"
      @today = "QUARTA-FEIRA"
    elsif @today == "Thursday"
      @today = "QUINTA-FEIRA"
    elsif @today == "Friday"
      @today = "SEXTA-FEIRA"
    elsif @today == "Saturday"
      @today = "SÁBADO"
    else
      @today = "DOMINGO"
    end
  end

  def market_params
     params.require(:market).permit(:address, :inscription, :name, :weekday, :latitude, :longitude)
  end
end

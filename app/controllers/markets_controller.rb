class MarketsController < ApplicationController
  before_action :set_date, only: [:show, :search]

  def search
    @markets = Market.all
    if params[:search_by_cep].present?
      @markets = @markets.near(params[:search_by_cep], 1)
    end
    if @markets.empty?
      flash[:alert] = "Não existem feiras próximas a este cep"
      redirect_to root_path
    end

    @markets = @markets.where.not(latitude: nil, longitude: nil, weekday: @today)
    @hash = Gmaps4rails.build_markers(@markets) do |market, marker|
      marker.lat market.latitude
      marker.lng market.longitude
    end
  end

  def show
    @market = Market.find(params[:id])
    # variavel recebe valor do metodo 'sellers_by_product'
    @sellers_by_product = sellers_by_product
  end

  private

  def set_date
    @today = Date.today.strftime('%A')
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

  def sellers_by_product
    product_seller = []
    @market.sellers.each do |seller|
      seller.products.each do |product|
        product_seller << [product, seller]
      end
    end
    product_seller.group_by(&:first).map { |fruit, pairs| [fruit, pairs.map(&:last)] }
  end

  def market_params
     params.require(:market).permit(:address, :inscription, :name, :weekday, :latitude, :longitude)
  end
end



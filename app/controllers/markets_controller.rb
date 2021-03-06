class MarketsController < ApplicationController
  before_action :set_date, only: [:show, :search]

  def search
    @markets = Market.all
    if params[:state_user] && params[:city_user] && params[:street_user] && params[:number_user].present?
      get_coockies(params)
      string_search = params[:city_user]+" "+params[:state_user]+" "+params[:street_user]+" "+params[:number_user]
      @markets = @markets.near(string_search, 1)
      @markets = @markets.where.not(latitude: nil, longitude: nil, weekday: @today)
      if @markets.empty?
        flash[:alert] = "Não existem feiras próximas a este cep"
        redirect_to root_path
      else
        @hash = Gmaps4rails.build_markers(@markets) do |market, marker|
        marker.lat market.latitude
        marker.lng market.longitude
        end
      end
    else
      redirect_to root_path
      flash[:alert] = "Você precisa preencher todos os campos com asterisco(*) para a busca!"
    end
  end

  def show
    @market = Market.find(params[:id])
    @order_item = current_order.order_items.new
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

  def get_coockies(params)
    session[:bairro] = params[:district_user].to_s
    session[:cep] = params[:zip_user].to_s
    session[:rua] = params[:street_user].to_s
    session[:estado] = params[:state_user].to_s
    session[:cidade] = params[:city_user].to_s
    session[:complemento] = params[:complement_user].to_s
    session[:numero] = params[:number_user].to_s
    true
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
end



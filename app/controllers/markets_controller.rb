class MarketsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @market = Market.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @market.destroy
    redirect_to markets_path
  end
end

class ConfirmationController < ApplicationController

  def choose_address
    result = Geocoder.search(session[:cep]).first.data
    get_coockies
  end

  def payment
  end

  def review
  end

  private

  def get_coockies
    @street = session[:rua]
    @number = session[:numero]
    @district = session[:bairro]
    @city = session[:cidade]
  end

end

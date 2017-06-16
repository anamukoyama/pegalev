class ConfirmationController < ApplicationController

  def choose_address
    result = Geocoder.search(session[:cep]).first.data
    @street = session[:rua]
    @number = session[:numero]
    @district = session[:bairro]
    @city = session[:cidade]
    # @city = result.first[1][3]["long_name"]     # cidade
  end

  def payment
  end

  def review
  end

end

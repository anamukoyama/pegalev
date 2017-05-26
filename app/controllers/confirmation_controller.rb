class ConfirmationController < ApplicationController

  def choose_address
    result = Geocoder.search(session[:cep]).first.data
    @street = result.first[1][1]["long_name"]   # rua
    @district = result.first[1][2]["long_name"] # bairro
    # @city = result.first[1][3]["long_name"]     # cidade
  end

  def payment
  end

  def review
  end

end

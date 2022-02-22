require_relative 'base_controller'

class ProductController < BaseController
  def index
    @products = [
      OpenStruct.new(
        name: 'Fancy Product',
        description: 'This is a really fancy product',
        price: '$100.00',
        image_url: "https://placebeard.it/640x360"
      ),
      OpenStruct.new(
        name: 'Not so fancy product',
        description: 'Less fancy product for less money',
        price: '$50.00',
        image_url: "https://placebeard.it/640x360"
      )
    ]
  end

  def show
  end
end
require_relative 'base_controller'

class ProductController < BaseController
  def index
    @products = products
  end

  def checkout
    @product = products.find { |product| product.id == params["id"].to_i }

    redirect_to '/'
  end

  def products
    [
      OpenStruct.new(
        name: 'Fancy Product',
        description: 'This is a really fancy product',
        price: 100.00,
        currency: '$',
        image_url: "https://placebeard.it/640x360",
        id: 1
      ),
      OpenStruct.new(
        name: 'Not so fancy product',
        description: 'Less fancy product for less money',
        price: 50.00,
        currency: '$',
        image_url: "https://placebeard.it/640x360",
        id: 2
      )
    ]
  end
end
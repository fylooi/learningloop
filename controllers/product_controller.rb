require_relative 'base_controller'

class ProductController < BaseController
  def index
    @products = products
  end

  def checkout
    @product = products.find { |product| product.id == params["id"].to_i }

    session = `curl https://api.stripe.com/v1/checkout/sessions -u sk_test_8sV9eWWPqD7XiIkUBPM5yNZr002eRBacOY: -d success_url="http://#{request.host_with_port}/products/success" -d cancel_url="http://#{request.host_with_port}/products/cancel" -d "line_items[0][price]"=#{@product.stripe_price} -d "line_items[0][quantity]"=1 -d mode=payment`
    
    checkout_url = session.match(/"url": "(.+?)"/).captures.first

    redirect_to checkout_url
  end

  def products
    [
      OpenStruct.new(
        name: 'Fancy Product',
        description: 'This is a really fancy product',
        price: 100.00,
        currency: '$',
        image_url: "https://placebeard.it/640x360",
        stripe_price: 'price_1KW1sWGTlDgpAlbNYO43lFcU',
        id: 1
      ),
      OpenStruct.new(
        name: 'Not so fancy product',
        description: 'Less fancy product for less money',
        price: 50.00,
        currency: '$',
        image_url: "https://placebeard.it/640x360",
        stripe_price: 'price_1KW1tUGTlDgpAlbNwncbxuCH',
        id: 2
      )
    ]
  end

  def success
  end

  def cancel
  end
end
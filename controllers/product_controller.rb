require_relative 'base_controller'

class ProductController < BaseController
  def index
    @products = ["Product 1", "Product 2", "Product 3"]
  end

  def show
  end
end
class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  def index
    @products = Product.all
    render json: @products.as_json(include: { image_attachment: { only: :url } })
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end

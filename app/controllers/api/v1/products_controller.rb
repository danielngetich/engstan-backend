class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
  
    def index
      products = Product.all
      render json: products.map { |product| product.as_json.merge(image_url: product.image_url) }
    end
  
    def show
      render json: @product.as_json.merge(image_url: @product.image_url)
    end
  
    def create
      product = Product.new(product_params)
      if product.save
        render json: product.as_json.merge(image_url: product.image_url), status: :created
      else
        render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @product.update(product_params)
        render json: @product.as_json.merge(image_url: @product.image_url), status: :ok
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @product.destroy
      head :no_content
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
  end
  
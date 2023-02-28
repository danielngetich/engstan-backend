class ProductsController < ApplicationController
    # def index
    #   @products = Product.all
    #   render json: @products
    # end
  
    # def create
    #   @product = Product.new(product_params)
    #   if @product.save
    #     render json: @product, status: :created
    #   else
    #     render json: @product.errors, status: :unprocessable_entity
    #   end
    # end
  
    # def show
    #   @product = Product.find(params[:id])
    #   render json: @product
    # end
  
    # def update
    #   @product = Product.find(params[:id])
    #   if @product.update(product_params)
    #     render json: @product
    #   else
    #     render json: @product.errors, status: :unprocessable_entity
    #   end
    # end
  
    # def destroy
    #   @product = Product.find(params[:id])
    #   @product.destroy
    #   head :no_content
    # end
  
    # private
  
    # def product_params
    #   params.require(:product).permit(:productName, :description, :price, :image)
    # end
 
  
    def index
      if params[:type] == 'plain'
        @products = Product.where(branded: false)
      elsif params[:type] == 'branded'
        @products = Product.where(branded: true)
      else
        redirect_to root_path
      end
    end
end

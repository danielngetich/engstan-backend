class ProductsController < ApplicationController
    def create
        product = Product.new(product_params)
        product.image.attach(params[:product][:image])
        if product.save
          render json: product, status: :created
        else
          render json: product.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def product_params
        params.require(:product).permit(:name, :description, :price; :image)
      end
end

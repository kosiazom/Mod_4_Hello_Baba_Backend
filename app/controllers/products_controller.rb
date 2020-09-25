class ProductsController < ApplicationController
    def index 
        @products = Product.all
        render json: @products, except: [:updated_at,:created_at], include:[:reviews,:orders]
    end
end


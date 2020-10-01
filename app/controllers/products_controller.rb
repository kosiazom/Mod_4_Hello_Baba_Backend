class ProductsController < ApplicationController
     skip_before_action :logged_in?, only:[:index]


    def index 
        @products = Product.all
        render json: @products, except: [:updated_at,:created_at], include:[:reviews,:orders]
    end
end


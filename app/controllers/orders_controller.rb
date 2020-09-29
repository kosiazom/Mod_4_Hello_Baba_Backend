class OrdersController < ApplicationController
  

    def index
        orders = Orders.all 
        render json: orders
    end

end

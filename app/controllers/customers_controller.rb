class CustomersController < ApplicationController
    def index
        @customers = Customer.all
        render json: @customers, except: [:updated_at, :created_at], include: [:orders,:products=>  {include: :reviews}]
    end
end

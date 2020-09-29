class CustomersController < ApplicationController
 
    skip_before_action :logged_in?, only:[:create]

    def index
        @customers = Customer.all
        render json: @customers, except: [:updated_at, :created_at], include: [:orders,:products=>  {include: :reviews}]
    end

    #SignUp
    def create
       byebug
        customer = Customer.new(customer_params)

        if customer.valid?
            customer.save 
            render json: customer, only:[:username, :password], status: :created

        else 
            render json: {error: "User not created!"}, status: :not_acceptable
        end
    end



    private

  def customer_params
    params.permit(:username, :password)
  end
end

class CustomersController < ApplicationController
    def index
        @customers = Customer.all
        render json: @customers, except: [:updated_at, :created_at], include: [:orders,:products=>  {include: :reviews}]
    end

    def create
        customer = Customer.new(customer_params)

        if customer.valid?
            customer.save 
            render json: {customer: customer}, status: :created

        else 
            render json: {error: "User not created!"}, status: :not_acceptable
        end
    end



    private

  def customer_params
    params.permit(:username, :password)
  end
end

class ApplicationController < ActionController::API
    # before_action :logged_in?

    def encode_token(payload)
        JWT.encode(payload, "hellobaba", "HS256")
    end

    # def logged_in?
        # byebug
    #    headers = request.headers["Authorization"] #logging in and having access to your things to see if they are logged in
    #     token = headers.split(" ")[1]
  
    #     begin
    #         customer_id = JWT.decode(token, "hellobaba")[0]["customer_id"]
    #         customer = Customer.find(customer_id)
    #     rescue 
    #         user = nil
    #     end
  
    #     render json: {error: "Please Login!!!"} unless customer

end

class ApplicationController < ActionController::API
    before_action :logged_in?

    def encode_token(payload)
        JWT.encode(payload, "hellobaba", "HS256")
    end

    def logged_in?
        # byebug
       # headers = request.headers["Authorization"] #logging in and having access to your things
        #token = headers.split(" ")[1]
    end

end

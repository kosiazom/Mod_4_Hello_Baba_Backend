class ApplicationController < ActionController::API
    # before_action :logged_in?

    def encode_token(payload)
        JWT.encode(payload, "hellobaba", "HS256")
    end

    def logged_in?
    end

end

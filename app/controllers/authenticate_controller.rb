class AuthenticateController < ApplicationController
  # skip_before_action :logged_in, only: [:create]


  def create
    customer = Customer.find_by(username: params[:username])

    if customer && customer.authenticate(params[:password])
      render json: {username: customer.username, token: encode_token({customer_id: customer.id})}
    else
      render json: {error: 'invalid username or password'}
  end
end

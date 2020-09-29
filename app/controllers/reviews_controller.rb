class ReviewsController < ApplicationController

    # before_action :logged_in?, only: [:create, :update, :destroy]
    
    def create
        review = Review.create(description: params[:description], customer_id: params[:customer_id], product_id: params[:product_id])
        render json: review
    end

    def update
        review = Review.find_by(params[:id])
        review.update(description: params[:description])
        render json: review
    end

    def destroy
        review = Review.find_by(params[:id])
        review.destroy
        render json:"Review is deleted!"
    end
    
end

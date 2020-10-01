class ReviewsController < ApplicationController

     skip_before_action :logged_in?, only: [:index]
    
    # def index

    #     review = Reviews.all
    #     render json:
    # end
    def create
        review = Review.create(description: params[:description], customer_id: params[:customer_id], product_id: params[:product_id])
        render json: review
    end

    def update
        review = Review.find_by(id: params[:id])
        review.update(description: params[:description])
        render json: review
    end

    def destroy
        # byebug
        review = Review.find_by(id: params[:id])
        review.destroy
        render json:"Review is deleted!"
    end
    
end

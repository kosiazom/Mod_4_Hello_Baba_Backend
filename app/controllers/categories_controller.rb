class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        render json: @categories, except:[:updated_at,:created_at], include: [:products]
    end
end

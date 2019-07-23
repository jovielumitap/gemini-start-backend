module Api
  module V1
    class CategoriesController < Api::V1::ApiController
      helper_method :category

      def show
        json_response({ category: category })
      end

      def index
        @categories = Category.all
        json_response({ categories: @categories })
      end

      def create
        @category = Category.create!(category_params)
        json_response({ category: @category })
      end

      def update
        category.update!(category_params)
        json_response({ category: @category })
      end

      def destroy
        category.destroy
        json_response({ delete: 'success' })
      end

      private

      def category_params
        params.require(:category).permit(:name)
      end
      def category
        @category = Category.find(category_id)
      end

      def category_id
        params[:id]
      end
    end
  end
end


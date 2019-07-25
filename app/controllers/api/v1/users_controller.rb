# encoding: utf-8

module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :authenticate_user!

      helper_method :user

      def show
        json_response({user: user})
      end

      def index
        users = User.where.not(user_type: 'admin').sort_by_id_asc
        json_response({users: users})
      end

      def create
        user = User.create!(register_params)
        json_response({user: user})
      end

      def profile
        render :show
      end

      private

      def register_params
        params.require(:user).permit(
            :user_type, :first_name, :last_name, :picture, :business_name, :address, :home_number, :zip_code, :city,
            :province, :cod_fisc, :p_lva, :mobile, :phone, :pec, :cuu, :specialization, :building,
            :category,
            :email,
            :password,
        )
      end

      def user
        @user ||= user_id.present? ? User.find(user_id) : current_user
      end

      def user_id
        params[:id]
      end

    end
  end
end

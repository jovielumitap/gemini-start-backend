module Api
  module V1
    class OutdoorsController < Api::V1::ApiController
      helper_method :outdoor

      def show
        json_response({outdoor: outdoor})
      end

      def index
        outdoors = Outdoor.all.sort_by_id_asc
        json_response({outdoors: outdoors})
      end

      def create
        outdoor = Outdoor.create!(outdoor_params)
        json_response({outdoor: outdoor})
      end

      def destroy
        outdoor.destroy
        json_response({delete: "success"})
      end

      private
      def outdoor
        @outdoor = Outdoor.find(outdoor_id)
      end

      def outdoor_params
        params.require(:body).permit(
            :body_type_id,
            :name,
            :address,
            :zip_code,
            :city,
            :province,
            :cod_fisc
        )
      end
      def outdoor_id
        params[:id]
      end
    end
  end
end


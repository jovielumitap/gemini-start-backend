module Api
  module V1
    class BuildingsController < Api::V1::ApiController
      helper_method :building

      def show
        json_response({building: building})
      end

      def index
        buildings = Building.all.sort_by_id_asc
        json_response({buildings: buildings})
      end

      def create
        building = Building.create!(building_params)
        json_response({building: building})
      end

      def destroy
        building.destroy
        json_response({delete: "success"})
      end

      private
      def building
        @building = Building.find(building_id)
      end

      def building_params
        params.require(:building).permit(
            :building_type_id,
            :name,
            :address,
            :zip_code,
            :city,
            :province,
            :cod_fisc
        )
      end
      def building_id
        params[:id]
      end
    end
  end
end

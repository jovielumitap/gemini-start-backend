module Api
  module V1
    class BuildingsController < Api::V1::ApiController
      helper_method :building

      def show
        json_response({building: building})
      end

      def index
        buildings = Building.all.sort_by_id_asc
        json_response({buildings: buildings}, include)
      end

      def create
        code = gen_random_string(7)
        building_params.merge({ building_code: code})
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

      def include
        {:building_type => {:only => :name}}
      end
    end
  end
end

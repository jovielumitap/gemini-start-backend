module Api
  module V1
    class BodiesController < Api::V1::ApiController
      helper_method :body

      def show
        json_response({body: body})
      end

      def index
        bodies = Body.all.sort_by_id_asc
        json_response({bodies: bodies}, include_param)
      end

      def create
        body = Body.create!(body_params)
        json_response({body: body})
      end

      def destroy
        body.destroy
        json_response({delete: "success"})
      end

      private
      def body
        @body = Body.find(body_id)
      end

      def body_params
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

      def include_param
        {:body_type => {:only => :name}}
      end

      def body_id
        params[:id]
      end
    end
  end
end


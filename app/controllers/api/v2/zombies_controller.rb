module API
  module V2
    class ZombiesController < VersionController
      def index
        render json: "#{@remote_ip} Version Two", status: :ok
      end
    end
  end
end
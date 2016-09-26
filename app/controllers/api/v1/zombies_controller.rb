module API
  module V1
    class ZombiesController < ApiController
      def index
        @zombies = Zombie.all

        if weapon = params[:weapon]
          @zombies = @zombies.where(weapon: weapon)
        end

        respond_to do |format|
          format.xml  { render xml:  @zombies, status: :ok }
          format.any  { render "index.json.jbuilder" }
        end
      end

      def show
        zombie = Zombie.find(params[:id])
        render json: zombie, status: :ok
      end
    end
  end
end
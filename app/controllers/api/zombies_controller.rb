module API
  class ZombiesController < ApplicationController
    def index
      zombies = Zombie.all

      if weapon = params[:weapon]
        zombies = zombies.where(weapon: weapon)
      end

      render json: zombies, status: :ok
    end

    def show
      zombie = Zombie.find(params[:id])
      render json: zombie, status: :ok
    end
  end
end

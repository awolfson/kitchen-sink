module API
  module V1
    class EpisodesController < ApplicationController
      def create
        episode = Episode.new(episode_params)

        if episode.save
          render json: episode, status: :created, location: api_v1_episode_url(episode)
          # render nothing: true, status: :no_content, location: api_episode_url(episode)
          # head :no_content, location: api_episode_url(episode)
        else
          render json: episode.errors, status: :unprocessable_entity
        end
      end

      def update
        episode = Episode.find(params[:id])
        if episode.update(episode_params)
          render json: episode, status: :ok
        else
          render json: episode.errors, status: :unprocessable_entity
        end
      end

      def destroy
        # episode = Episode.find(params[:id])
        episode = Episode.find_unarchived(params[:id])

        # episode.destroy
        episode.archive

        head :no_content
      end

      private

      def episode_params
        params.require(:episode).permit(:title, :description)
      end
    end
  end
end
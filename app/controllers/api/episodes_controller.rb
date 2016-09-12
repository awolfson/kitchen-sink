module API
  class EpisodesController < ApplicationController
    def create
      episode = Episode.new(episode_params)

      if episode.save
        render json: episode, status: :created, location: api_episode_url(episode)
        # render nothing: true, status: :no_content, location: api_episode_url(episode)
        # head :no_content, location: api_episode_url(episode)
      else
        render json: episode.errors, status: :unprocessable_entity
      end
    end

    private

    def episode_params
      params.require(:episode).permit(:title, :description)
    end
  end
end
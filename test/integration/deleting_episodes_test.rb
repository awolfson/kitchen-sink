require 'test_helper'

class DeletingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com'
    @episode = Episode.create!(title: "Delete Me Please!")
  end

  test "deletes existing episode" do
    delete api_episode_path(@episode)
    # delete "/episodes/#{@episode.id}"

    assert_equal 204, response.status
  end
end

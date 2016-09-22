require 'test_helper'

class CreatingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com'
  end

  test 'creates episodes' do
    post '/v1/episodes',
      params: { episode:
                { title: "It's Bananas", description: 'Learn about bananas.' }
              }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s }

    assert_equal 201, response.status
    assert_equal Mime[:json], response.content_type

    episode = json(response.body)
    assert_equal api_v1_episode_url(episode[:id]), response.location
  end

  test 'does not create episodes with title nil' do
    post '/v1/episodes',
      params: { episode:
                { title: nil, description: 'Learn about bananas.' }
              }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s }

    assert_equal 422, response.status
    assert_equal Mime[:json], response.content_type
  end
end

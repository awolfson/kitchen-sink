require 'test_helper'

class UpdatingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com'
    @episode = Episode.create!(title: "First Title")
  end

  test "successful update" do
    patch "/episodes/#{@episode.id}",
      params: { episode: { title: "First Title Edit"} }.to_json,
      headers: { "Accept" => Mime[:json], "Content-Type" => Mime[:json].to_s }

    assert_equal 200, response.status
    assert_equal "First Title Edit", @episode.reload.title
  end

  test "unsuccessful update on short title" do
    patch "/episodes/#{@episode.id}",
      params: { episode: { title: "Short"} }.to_json,
      headers: { "Accept" => Mime[:json], "Content-Type" => Mime[:json].to_s }

    assert_equal 422, response.status
  end
end

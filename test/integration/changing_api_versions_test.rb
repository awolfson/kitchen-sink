require 'test_helper'

class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  setup do
    host! "api.example.com"
    @ip = "123.123.12.12."
  end

  test "/v2 returns version 1" do
    get "/v2/zombies", params: {}, headers: { "REMOTE_ADDR" => @ip }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version Two", response.body
  end
end

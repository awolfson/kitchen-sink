require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com'
    @zombie = Zombie.create!(name: 'John', weapon: 'axe')
    @joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')
  end

  test 'returns list of all zombies' do
    get '/v1/zombies'

    assert_equal 200, response.status
    assert response.success?

    refute_empty response.body
  end

  test 'returns zombies filtered by weapon' do
    get '/v1/zombies?weapon=axe'
    assert_equal 200, response.status

    zombies = json(response.body)
    names = zombies.map { |zombie| zombie[:name] }

    assert_includes names, 'John'
    refute_includes names, 'Joanna'
  end

  test 'returns zombie by id' do
    get "/v1/zombies/#{@zombie.id}"
    assert_equal 200, response.status

    zombie_response = json(response.body)
    assert_equal @zombie.name, zombie_response[:name]
  end

  test 'returns zombies in JSON' do
    get '/v1/zombies', params: {}, headers: { 'Accept' => Mime[:json] }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end

  test 'returns zombies in XML' do
    get '/v1/zombies', params: {}, headers: { 'Accept' => Mime[:xml] }

    assert_equal 200, response.status
    assert_equal Mime[:xml], response.content_type
  end

  test 'returns list of zombies in english' do
    get '/v1/zombies', params: {}, headers: { 'Accept-Language' => 'en', 'Accept' => Mime[:json] }
    assert_equal 200, response.status

    zombies = json(response.body)
    assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message]
  end

  test 'returns list of zombies in portuguese' do
    get '/v1/zombies', params: {}, headers: { 'Accept-Language' => 'pt-BR', 'Accept' => Mime[:json] }
    assert_equal 200, response.status

    zombies = json(response.body)
    assert_equal "Cuidado com #{zombies[0][:name]}!", zombies[0][:message]
  end

  test 'returns list of zombies in english by default after returning list in another language' do
    get '/v1/zombies', params: {}, headers: { 'Accept-Language' => 'pt-BR', 'Accept' => Mime[:json] }
    get '/v1/zombies'

    assert_equal 200, response.status

    zombies = json(response.body)
    assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message]
  end
end

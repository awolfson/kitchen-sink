require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com' }

  test 'returns list of all zombies' do
    get '/zombies'

    assert_equal 200, response.status
    assert response.success?

    refute_empty response.body
  end

  test 'returns zombies filtered by weapon' do
    john = Zombie.create!(name: 'John', weapon: 'axe')
    joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')

    get '/zombies?weapon=axe'
    assert_equal 200, response.status

    zombies = json(response.body)
    names = zombies.map { |zombie| zombie[:name] }

    assert_includes names, 'John'
    refute_includes names, 'Joanna'
  end

  test 'returns zombie by id' do
    zombie = Zombie.create!(name: 'John', weapon: 'axe')

    get "/zombies/#{zombie.id}"
    assert_equal 200, response.status

    zombie_response = json(response.body)
    assert_equal zombie.name, zombie_response[:name]
  end
end

require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "it should get a list of all players" do
    get players_path, xhr: true
    assert_response :success
    assert_equal "application/json", @response.media_type
    json_response = JSON.parse(@response.body)
    assert true, json_response.instance_of?(Array)
  end

  test "it should be able to find players by name" do
    get players_path, params: {name: "Test Guy"}, xhr: true
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal "Test Guy", json_response[0]["name"]
  end

  test "it should be able to find players by team" do
    get players_path, params: {team: "TST"}, xhr: true
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal json_response.count, 2
  end

  test "it should be able to find players by role" do
    get players_path, params: {role: 'captain'}, xhr: true
    json_response = JSON.parse(@response.body)
    assert_equal 2, json_response.count
    assert_equal "Test Guy", json_response[0]["name"] 
  end
end

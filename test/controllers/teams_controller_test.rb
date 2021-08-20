require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should be able to get a list of teams" do
    get teams_path, xhr: true
    assert_response :success
    assert_equal "application/json", @response.media_type
    json_response = JSON.parse(@response.body)
    assert_equal true, json_response.instance_of?(Array)
    assert_equal Team.first.key, json_response[0]["key"]
  end

  test "should be able to find by key" do
    get teams_path, params: {key: "TST"}, xhr: true
    json_response = JSON.parse(@response.body)
    assert_equal 1, json_response.count
    assert_equal "TST", json_response[0]["key"]
  end

  test "should be able to search by name" do
    get teams_path, params: {name: "test team of testers"}
    json_response = JSON.parse(@response.body)
    assert_equal 1, json_response.count
    assert_equal "test team of testers", json_response[0]["name"]
  end
end

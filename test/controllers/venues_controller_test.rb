require "test_helper"

class VenuesControllerTest < ActionDispatch::IntegrationTest
  test "it should be able to get a list of venues" do
    get venues_path, xhr: true
    assert_response :success
    assert_equal "application/json", @response.media_type
    json_response = JSON.parse(@response.body)
    assert_equal true, json_response.instance_of?(Array)
    assert_equal Venue.first.key, json_response[0]["key"]
  end

  test "should be able to search by key" do
    get venues_path, params: {key: "TST"}, xhr: true
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal "some test venue", json_response[0]["name"]
    assert_equal 1, json_response.count
  end

  test "should be able to search by name" do
    get venues_path, params: {name: "some test venue"}, xhr: true
    json_response = JSON.parse @response.body
    assert_equal "TST", json_response[0]["key"]
    assert_equal 1, json_response.count
  end
end

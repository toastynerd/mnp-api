require "test_helper"

class MatchesControllerTest < ActionDispatch::IntegrationTest
  test "it should get a list of matches" do
    get matches_path, xhr: true
    assert_response :success
    assert_equal "application/json", @response.media_type
    json_response = JSON.parse(@response.body)
    assert_equal true, json_response.instance_of?(Array)
    assert_equal json_response.count, Match.count
  end

  test "it should be able to find matches by week" do
    get matches_path, params: { week: 1 }, xhr: true
    json_response = JSON.parse(@response.body)
    assert_equal 1, json_response.count
  end

  test "it should be able to find matches by home team" do
    get matches_path, params: { home: "TST" }, xhr: true
    json_response = JSON.parse @response.body
    assert_equal 1, json_response.count
  end

  test "it should be able to find matches by away team" do
    get matches_path, params: { away: "TST" }, xhr: true
    json_response = JSON.parse @response.body
    assert_equal 1, json_response.count
  end

  test "it should be able to find matches by venue" do
    get matches_path, params: { venue: "TST" }, xhr: true
    json_response = JSON.parse @response.body
    assert_equal 2, json_response.count
  end

  test "it should be able to find matches by date" do
    get matches_path, params: { date: Date.today }, xhr: true
    json_response = JSON.parse @response.body
    assert_equal 2, json_response.count
  end
end

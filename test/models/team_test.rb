require "test_helper"

class TeamTest < ActiveSupport::TestCase
  setup do
    @params = {
      key: "TS2",
      venue_key: "TST",
      name: "Test Team"
    }
  end

  test "should save with valid params" do
    team = Team.new(@params)
    assert team.save
  end

  test "key should be three letters" do
    @params[:key] = "bad key"
    team = Team.new(@params)
    assert_not team.save
  end

  test "key should be unique" do
    @params[:key] = "TST"
    team = Team.new(@params)
    assert_not team.save
  end
end

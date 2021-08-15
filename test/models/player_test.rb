require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  setup do
    @params = {
      name: "Test Player",
      team: "SWL",
      role: "captain"
    }
  end

  test "it should save with proper params" do
    player = Player.new(@params)
    assert player.save
  end

  test "should not save without a name" do
    @params.delete(:name)
    player = Player.new(@params)
    assert_not player.save
  end

  test "should not save without a team" do
    @params.delete(:team)
    player = Player.new(@params)
    assert_not player.save
  end

  test "should not save without a role" do
    @params.delete(:role)
    player = Player.new(@params)
    assert_not player.save
  end

  test "should only have roles that are captain, assistant or player" do
    @params[:role] = "some other roll"
    player = Player.new(@params)
    assert_not player.save
  end
end

require "test_helper"

class MatchTest < ActiveSupport::TestCase
  setup do
    @params = {
      week: 1,
      home: "TST",
      away: "TSB",
      venue: "TST",
      date: Date.today
    }
  end

  test "it should save with valid params" do
    match = Match.new(@params)
    assert match.save
  end

  test "it should not save without a home team" do
    @params.delete(:home)
    match = Match.new(@params)
    assert_not match.save
  end

  test "home team should be 3 letter key" do
    @params[:home] = "should not work"
    match = Match.new(@params)
    assert_not match.save
  end

  test "it should not save without an away team" do
    @params.delete(:away)
    match = Match.new(@params)
    assert_not match.save
  end

  test "away should be 3 letter key" do
    @params[:away] = "should not work"
    match = Match.new(@params)
    assert_not match.save
  end

  test "it should not save without a venue" do
    @params.delete(:venue)
    match = Match.new(@params)
    assert_not match.save
  end

  test "venue should be 3 letter key" do
    @params[:venue] = "should not work"
    match = Match.new(@params)
    assert_not match.save
  end

  test "it should not save without a week" do
    @params.delete(:week)
    match = Match.new(@params)
    assert_not match.save
  end

  test "it should not save without a date" do
    @params.delete(:date)
    match = Match.new(@params)
    assert_not match.save
  end
end

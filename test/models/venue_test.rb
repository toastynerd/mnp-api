require "test_helper"

class VenueTest < ActiveSupport::TestCase
  setup do
    @params = {
      key: "TSV",
      name: "test venue"
    }
  end

  test "it should save with valid paramaters" do
    venue = Venue.new(@params)
    assert venue.save
  end

  test "it should have a three letter key" do
    @params[:key] = "too long of a key"
    venue = Venue.new(@params)
    assert_not venue.save
  end

  test "it should have a unique key" do
    @params[:key] = "TST" #established in fixtures
    venue = Venue.new(@params)
    assert_not venue.save
  end
end

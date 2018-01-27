require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url, as: :json
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { context: @trip.context, state: @trip.state } }, as: :json
    end

    assert_response 201
  end

  test "should show trip" do
    get trip_url(@trip), as: :json
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { context: @trip.context, state: @trip.state } }, as: :json
    assert_response 200
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip), as: :json
    end

    assert_response 204
  end

  test "should fail if no context" do
    skip "Check https://stackoverflow.com/questions/48476911/undefined-method-response-code-for-nilnilclass-for-integrationtest-that-fails"
    assert_raises(ActiveRecord::NotNullViolation) do
      post trips_url, params: { trip: { state: @trip.state } }
    end
    assert_response 400
  end
end

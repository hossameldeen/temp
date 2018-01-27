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
    post trips_url, params: { trip: { state: @trip.state } }
    assert_response 422
  end

  test "should fail if no state" do
    post trips_url, params: { trip: { context: @trip.context } }
    assert_response 422
  end

  test "should update state from ongoing to completed" do
    patch trip_url(trips(:ongoing)), params: { trip: { state: :completed } }
    assert_response 200
  end

  # TODO: Assumption: Can change the trip from not_started_yet to completed directly
  test "should update state from not_started_yet to completed" do
    patch trip_url(trips(:not_started_yet)), params: { trip: { state: :completed } }
    assert_response 200
  end

  test "should fail if updating state from ongoing to not_started_yet" do
    patch trip_url(trips(:ongoing)), params: { trip: { state: :not_started_yet } }
    assert_response 422
  end
end

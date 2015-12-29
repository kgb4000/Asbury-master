require 'test_helper'

class ChurchEventsControllerTest < ActionController::TestCase
  setup do
    @church_event = church_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:church_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create church_event" do
    assert_difference('ChurchEvent.count') do
      post :create, church_event: { event_date: @church_event.event_date, event_description: @church_event.event_description, event_location: @church_event.event_location, event_name: @church_event.event_name, event_time: @church_event.event_time }
    end

    assert_redirected_to church_event_path(assigns(:church_event))
  end

  test "should show church_event" do
    get :show, id: @church_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @church_event
    assert_response :success
  end

  test "should update church_event" do
    patch :update, id: @church_event, church_event: { event_date: @church_event.event_date, event_description: @church_event.event_description, event_location: @church_event.event_location, event_name: @church_event.event_name, event_time: @church_event.event_time }
    assert_redirected_to church_event_path(assigns(:church_event))
  end

  test "should destroy church_event" do
    assert_difference('ChurchEvent.count', -1) do
      delete :destroy, id: @church_event
    end

    assert_redirected_to church_events_path
  end
end

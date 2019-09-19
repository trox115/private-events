require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @carlos = users(:carlos)
    @event = events(:event1)
  end
  test "should not get index without login" do
    get events_url
    assert_redirected_to login_url
  end  

  test "should not be able get new without login" do
    get new_event_url
    assert_redirected_to login_url
  end

  test "should not be able to create an event without login" do
    post events_url, params: { event: { title: @event.title,
                                        description: @event.description,
                                        date: @event.date, 
                                        guests: []} }
    assert_redirected_to login_url
  end

  test "should not be able to show event" do
    get event_url(@event)
    assert_redirected_to login_url
  end

  test "should get index" do
    post login_url, params: { session: { name: @carlos.name }}
    get events_url
    assert_response :success
  end

  test "should get new" do
    post login_url, params: { session: { name: @carlos.name }}
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    post login_url, params: { session: { name: @carlos.name }}
    assert_difference('Event.count') do
      post events_url, params: { event: { title: @event.title, 
                                          description: @event.description, 
                                          date: @event.date, 
                                          guests: [] } }
    end
    assert_response :redirect
  end

  test "should show event" do
    post login_url, params: { session: { name: @carlos.name }}
    get event_url(@event)
    assert_response :success
  end

end

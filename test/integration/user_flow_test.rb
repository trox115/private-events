require 'test_helper'
 
class UserFlowsTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:carlos)
    @event = events(:event1)
  end

  test "User log in and create an event" do
    get login_path
    post login_path, params: { session: { name: @user.name } }
    follow_redirect!
    get events_path
    assert_template 'events/index'
    assert is_logged_in?, "Is logged in : #{is_logged_in?}"
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', signup_path, count: 0
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', events_path
    assert_select 'a[href=?]', new_event_path
    assert_select 'a[href=?]', logout_path

    get new_event_path
    assert_template 'events/new'

    title = 'Parranda'
    description = "A vallenato party"
    assert_difference 'Event.count', 1 do
      post events_path, params: { event:
                                      { title: title,
                                        description: description,
                                        guests: [] } }
    end

    follow_redirect!
    assert_match description, response.body

  end  
  test 'Events should be editable by the creator only' do
    get login_path
    post login_path, params: { session: { name: @user.name } }
    follow_redirect!
    get event_path(@event)
    assert_template 'events/show'
    assert_response :success
    assert_select 'a[href=?]', edit_event_path(@event), count: 0

  end
end

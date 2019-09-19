require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:carlos)
    @event = events(:event1)
    @past_event = events(:past_event)
  end

  test 'should be valid' do
    assert @event.valid?
  end
  test 'title should be present' do
    @event.title = '     '
    assert_not @event.valid?
  end
  test 'description should be present' do
    @event.description = '     '
    assert_not @event.valid?
  end
  test 'creator should be present' do
    @event.creator = nil
    assert_not @event.valid?
  end

  test 'Events in the past should not be valid' do
    e = @user.events.new(title:"Future", description: "event", date: Time.now - 1.week)
    assert_not e.valid?
  end

  test 'edit an event should be in the future' do
    @event.date = Time.now - 1.week
    assert_not @event.valid?
  end

  test 'event that is in the future could be re scheduled' do
    @event.date = Time.now + 2.day
    assert @event.valid?
  end

  test 'past events can not be rescheduled' do
    @past_event.date = Time.now + 1.month
    assert_not @past_event.valid?
  end

end

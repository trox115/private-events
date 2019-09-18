require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:carlos)
    @event = events(:event1)
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
end

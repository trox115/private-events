# frozen_string_literal: true

module AttendancesHelper
  def retrieve_name_event(_atendances)
    Event.find_by(id: @user_attendance.ids).title
   end

  def retrieve_id_event(_atendances)
    Event.find_by(id: @user_attendance.ids).id
  end

  def test(_atendances)
    Event.find_by(id: @user_attendance.events_as_attendee.ids).title
  end
end

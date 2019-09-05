module AttendancesHelper
  def retrieve_name_event(atendances)
    Event.find_by(id: @user_attendance.ids).title
   end

   def retrieve_id_event(atendances)
    Event.find_by(id: @user_attendance.ids).id
   end

   def test(atendances)
   Event.find_by(id: @user_attendance.events_as_attendee.ids).title
   end
end

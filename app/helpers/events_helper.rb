module EventsHelper
  def eventcreator(event)
    User.find_by(id: event.creator).name
  end
  def retrieve_name(attendees)
   User.find_by(id: attendees.ids).name
  end
end

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'User creates and event and add invited users' do
    it 'Creates the user, the event and invites users' do
      user = FactoryBot.create(:user)
      e = user.events.build(title: "After Club Party", description: "The most wonderful party")
      
      #creates and invites users
      5.times do
        e.guests << FactoryBot.create(:user)
        e.save()
      end

      #confirm the attending for each user
      e.guests.each do | guest |
        e.attendances.select { |a| a.attendee_id == guest.id }[0].attending = true
      end

      expect(e.guests.length).to eq 5
      expect(e.attendances.length).to eq 5
      expect(e.attendances.first.attending).to eq true
      
      #expect(invitation).to be_empty, "Invitation: #{invitation.inspect}"
    end
  end
end

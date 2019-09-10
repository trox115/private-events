require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'User creates and event and add invited users' do
    it 'Creates the user, the event and ivites users' do
      user = FactoryBot.create(:user)
      user.valid?

      e = user.events.build(title: "After Club Party", description: "The most wonderful party")
      expect(e.attendees).to be_empty
      5.times do
        e.attendees << FactoryBot.create(:user)
      end
      expect(e.attendees.length).to eq 5
      expect(e.attendances.length).to eq 5
      expect(e.attendances.first.attending).to eq false
    end
  end
end

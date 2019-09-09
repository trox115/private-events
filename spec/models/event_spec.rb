require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Create events with valid information' do
    it 'Creates an event with valid information' do
      user = User.new(
        name: "carlos",
        email: "carlos@gmail.com",
        password: "12345678"
      )
      user.save()
      
      event = Event.new(
        title: "The Borders Concert",
        description: "The borders concert is a nice event",
        user_id: user.id
      )
      expect(event).to be_valid
    end

    it 'Does not create an event without title' do
      event = Event.new(title: nil)
      event.valid?
      expect(event.errors[:title]).to include("can't be blank")
    end

    it 'Does not create an event without description' do
      event = Event.new(description: nil)
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")
    end
  end
end

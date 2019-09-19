# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Create events with valid information' do
    it 'Creates an event with valid information' do
      user = FactoryBot.create(:user)

      event = Event.new(
        title: 'The Borders Concert',
        description: 'The borders concert is a nice event',
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

  context 'Using FactoryBot' do
    it 'generates associated data from a factory' do
      event = FactoryBot.create(:event)
    end

    it 'Creates an event for tomorrow' do
      event = FactoryBot.create(:event, :tomorrow)
      expect(event.date.day).to eq (Time.now + 1.day).day
    end

    it 'Creates an event for the next week' do
      event = FactoryBot.create(:event, :next_week)
      expect(event.date.day).to eq (Time.now + 1.week).day
    end

    it 'Creates an event for the next month' do
      event = FactoryBot.create(:event, :next_month)
      expect(event.date.day).to eq (Time.now + 1.month).day
    end
  end
end

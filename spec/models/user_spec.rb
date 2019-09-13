require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create a user with valid information' do
    it 'Creates the user' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'Is invalid without a name' do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'Is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'Is invalid without an password' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'Is invalid with a duplicate email address' do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it 'User password too short' do
      user = FactoryBot.build(:user, password: '123')
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")#, "User Errors:#{user.errors[:password].inspect}"
    end

    it 'Invalid email address' do
      user = FactoryBot.build(:user, email: "example.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
  end

  context 'Create user with events' do
    it 'creates an user with 5 events' do
      user = FactoryBot.create(:user, :with_events)
      expect(user.events.length).to eq 5
    end
  end
end

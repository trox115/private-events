require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Create a user with valid information' do
    it 'Creates the user' do
      user = User.new(
        name: "carlos",
        email: "carlos@gmail.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      expect(user).to be_valid
    end

    it 'Is invalid without a name' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end

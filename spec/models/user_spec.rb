require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create a user with valid information' do
    it 'Creates the user' do
      user = FactoryBot.build(:user)
      expect(user.valid?).to eq true
      expect(user).to be_valid
    end

    it 'Is invalid without a name' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'Is invalid without an email' do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'Is invalid without an password' do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'Is invalid with a duplicate email address' do
      User.create(
        name: "carlos",
        email: "carlos@gmail.com",
        password: "12345678"
      )

      user = User.new(
        name: "carlos thiago",
        email: "carlos@gmail.com",
        password: "12345678"
      )

      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
    it 'User password too short' do
    user = User.new(
        name: "carlos thiago",
        email: "carlos@gmail.com",
        password: "123"
      )
      user.valid?
      expect(user).not_to be_valid
     
    end
    it 'Invalid email address' do
      user = User.new(
          name: "carlos thiago",
          email: "carlos.com",
          password: "12345678"
        )
        user.valid?
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("is invalid")
       
      end
  end
end

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'User creates and event and add invited users' do
    it 'Creates the user, the event and ivites users' do
      user = FactoryBot.create(:user)
      user.valid?
    end
  end
end

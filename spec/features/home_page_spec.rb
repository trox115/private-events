
require 'rails_helper'
 
RSpec.describe 'Home', type: :feature do
  scenario 'Home page' do
    visit root_path
    expect(page).to have_content('Welcome to the Events APP')
    respond_to be_success
  end

  scenario 'Go to login page' do
    visit login_path
    expect(page).to have_content("Log in")
    expect(page).to have_content("New user?")
    expect(page).to have_content("Sign up now!")
    respond_to be_success
  end

  scenario 'Go to sign up page' do
    visit signup_path
    expect(page).to have_content("Log in")
    #expect(page).to have_content("Create My Account")
    expect(page).to have_content("Sign up")
    respond_to be_success
  end
end
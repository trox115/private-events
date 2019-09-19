# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log In', type: :feature do
  scenario 'Sign Up to the site' do
    visit signup_url
    respond_to be_success
    within('#new_user') do
      fill_in 'Name', with: 'user'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Your password', with: '12345678'
      fill_in 'Password Confirmation', with: '12345678'
    end
    click_button 'Create My Account'
    expect(page).to have_content 'Welcome to the Events App, user!'
    visit events_path
    expect(page).to have_current_path '/login'
    within('form') do
      fill_in 'Email', with: 'user@example.com'
    end
    click_button 'Log in'
    expect(page).to have_content 'Log in successful'
    respond_to be_success

    visit root_url
    expect(page).to have_content('Logout')
    expect(page).to have_content('See all Events')
    expect(page).to have_content('Create an Event')
    respond_to be_success

    visit events_path
    expect(page).to have_content('Logout')
    expect(page).to have_content('See all Events')
    expect(page).to have_content('Create an Event')
    respond_to be_success

    user = User.find_by(email: 'user@example.com')
    e = user.events.first
    visit events_path(e)
    respond_to be_success
    expect(page).to have_content('Logout')
    expect(page).to have_content('See all Events')
    expect(page).to have_content('Create an Event')
  end
end

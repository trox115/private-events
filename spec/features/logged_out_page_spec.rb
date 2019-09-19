# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  scenario 'Go to Home page' do
    visit root_path
    expect(page).to have_content('Welcome to the Events APP')
    respond_to be_success
  end

  scenario 'Go to login page' do
    visit login_path
    expect(page).to have_content('Log in')
    expect(page).to have_content('New user?')
    expect(page).to have_content('Sign up now!')
    respond_to be_success
  end

  scenario 'Go to sign up page' do
    visit signup_path
    expect(page).to have_content('Log in')
    # expect(page).to have_content("Create My Account")
    expect(page).to have_content('Sign up')
    has_field? 'user_password'
    has_field? 'user_password_confirmation'
    has_field? 'Create My Account'
    respond_to be_success
  end
  scenario 'Unauthenticated user try to access user profile goes redirected to login page' do
    visit '/users/1'
    expect(page).to have_current_path '/login'
  end
end

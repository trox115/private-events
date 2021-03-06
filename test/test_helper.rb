# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  fixtures :all
  include ApplicationHelper
  # Add more helper methods to be used by all tests here...

  # Returns true if a test user is logged in.
  def logged_in?
    !session[:name].nil?
  end

  # Log in as a particular user.
  def log_in_as(user)
    puts 'logging in!!'
    session[:name] = user.name
  end
  # Add more helper methods to be used by all tests here...
end

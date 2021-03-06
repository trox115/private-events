# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true
  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  has_many :events
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :events_as_attendee, through: :attendances, source: 'attended_event'
  scope :past, -> { where("date < ?", DateTime.now) }
  scope :future, -> { where("date > ?", DateTime.now) }
end

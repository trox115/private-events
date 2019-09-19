
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :guests, through: :attendances, source: "attendee"
  validates :date, presence: true
  validate :event_is_in_future, on: :create
  validate :past_events_cant_change, on: :update 
  validates :title, presence: true
  validates :description, presence: true

  scope :future, -> { where("date > ?", DateTime.now) }
  scope :past, -> { where("date < ?", DateTime.now) }

  def event_is_in_future
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
  def past_events_cant_change
    event = Event.find_by(id: id)
    if date.present? && date < Date.today && event.date != date
      errors.add(:date, "past events can't change")
    end
  end
end

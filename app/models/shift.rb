# frozen_string_literal: true

class Shift < ApplicationRecord
  SHIFT_HOURS = [[0, 8], [8, 16], [16, 0]].freeze

  belongs_to :user

  validates :start, :finish, presence: true
  validates :user_id, uniqueness: {
    scope: %i[start finish],
    message: ->(object, _data) do
      'Shift for a date is already present: '\
        "#{object[:start].to_formatted_s(:short)} - #{object[:finish].strftime('%H:%M')}"
    end
  }

  validate :validate_date
  validate :validate_hours

  private

  def validate_date
    the_same_day_shift = user.shifts.where(start: start.beginning_of_day..start.end_of_day).last
    return unless the_same_day_shift

    errors.add(:base, 'Shift is already present on: '\
      "#{the_same_day_shift.start.to_formatted_s(:short)} - #{the_same_day_shift.finish.strftime('%H:%M')}")
  end

  def validate_hours
    return if SHIFT_HOURS.include?([start.hour, finish.hour])

    errors.add(:base, 'Shift for '\
      "#{start.strftime('%d %b')} should match one of ranges: 00:00-08:00, 08:00-16:00, 16:00-24:00")
  end
end

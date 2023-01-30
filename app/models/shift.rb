# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to :user

  validates :start, :finish, presence: true
  validates :user_id, uniqueness: {
    scope: %i[start finish],
    message: ->(object, _data) do
      'Shift for a date is already present: '\
        "#{object[:start].to_formatted_s(:short)} - #{object[:finish].strftime('%H:%M')}"
    end
  }
end

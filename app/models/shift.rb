# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to :user

  validates :start, :finish, presence: true
  validates :user_id, uniqueness: {
    scope: %i[start finish]
  }
end

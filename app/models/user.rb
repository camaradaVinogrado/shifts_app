# frozen_string_literal: true

class User < ApplicationRecord
  has_many :shifts, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
end

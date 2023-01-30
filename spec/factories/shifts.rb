# frozen_string_literal: true

FactoryBot.define do
  factory :shift do
    start { '2023-01-30 08:00:00' }
    finish { '2023-01-30 16:00:00' }
    user { nil }
  end
end

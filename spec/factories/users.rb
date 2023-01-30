# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Maks' }
    last_name { 'Pridman' }
    email { 'makspridman@youpipe.com' }
  end
end

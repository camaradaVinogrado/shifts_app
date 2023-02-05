# frozen_string_literal: true

require 'rails_helper'

describe Shift do
  describe 'validation' do
    describe 'hours' do
      it 'valid if hours are in allowed range' do
        shift = Shift.new(
          start: '2023-02-21T00:00',
          finish: '2023-02-21T08:00',
          user_id: 2
        )

        expect(shift.valid?).to be true
      end

      it 'invalid if hours are not in allowed range' do
        shift = Shift.new(
          start: '2023-02-21T00:00',
          finish: '2023-02-21T10:00',
          user_id: 2
        )

        expect(shift.valid?).to be false
      end
    end
  end
end

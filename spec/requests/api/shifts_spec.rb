# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shifts', type: :request do
  describe 'create shifts' do
    subject do
      post api_shifts_url, params: '{ "user_id": "2",
                                      "shifts": [{"start": "2023-02-21T00:00", "finish": "2023-02-21T08:00"},
                                                 {"start": "2023-02-22T00:00", "finish": "2023-02-22T08:00"}] }',
                           headers: { 'Content-Type' => 'application/json' }
    end

    it 'successfuly responses, creates shifts', :aggregate_failures do
      expect { subject }.to change { Shift.count }.by(2)
      expect(response).to have_http_status(:success)
    end

    context 'if the user shifts are present for the same day' do
      let!(:shift) { create(:shift, user_id: 2, start: '2023-02-21T00:00', finish: '2023-02-21T08:00') }

      it 'does not create shifts' do
        expect { subject }.not_to change { Shift.count }
      end
    end
  end
end

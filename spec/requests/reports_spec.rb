require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST /reports' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          report: {
            reported_user_id: other_user.id,
            report_type: 'Harassment',
            description: 'Inappropriate behavior'
          }
        }
      end

      it 'creates a new report' do
        expect {
          post reports_path, params: valid_params
        }.to change(Report, :count).by(1)
      end

      it 'returns a redirect status' do
        post reports_path, params: valid_params
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          report: {
            reported_user_id: other_user.id,
            report_type: '',
            description: 'Missing type'
          }
        }
      end

      it 'does not create a report' do
        expect {
          post reports_path, params: invalid_params
        }.not_to change(Report, :count)
      end

      it 'returns unprocessable entity status' do
        post reports_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
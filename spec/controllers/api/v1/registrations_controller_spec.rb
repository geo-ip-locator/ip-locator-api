require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { user: { email: 'test@example.com', password: 'password' } } }
      signup_user

      it 'creates a new user' do
        expect { post :create, params: valid_params }.to change(User, :count).by(1)
      end

      it 'returns a success message' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to eq('message' => I18n.t('api.v1.registrations.success'))
      end
    end
  end
end

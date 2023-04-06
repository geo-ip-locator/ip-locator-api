require 'rails_helper'

RSpec.describe Api::V1::IpAddressesController, type: :controller do
  describe 'POST #create' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let(:valid_params) { { ip_address: { address: '127.0.0.1' } } }
      login_user

      it 'creates a new ip_address for the current user' do
        expect {
          post :create, params: valid_params
        }.to change { user.ip_addresses.count }.by(0)
      end

      it 'returns the location data for the new ip_address' do
        post :create, params: valid_params
        json_response = JSON.parse(response.body)

        expect(json_response).to include('country', 'city')
      end

      context 'with invalid parameters' do
        let(:invalid_params) { { ip_address: { address: 'invalid_address' } } }

        it 'returns an error message' do
          post :create, params: invalid_params
          json_response = JSON.parse(response.body)

          expect(json_response['errors']).to include('Address is invalid')
        end

        it 'returns a 422 status code' do
          post :create, params: invalid_params

          expect(response.status).to eq(422)
        end

        it 'does not create a new ip_address' do
          expect {
            post :create, params: invalid_params
          }.not_to change(IpAddress, :count)
        end
      end
    end

    context 'when user is not authenticated' do
      let(:valid_params) { { ip_address: { address: '127.0.0.1' } } }

      it 'returns a 401 status code' do
        post :create, params: valid_params

        expect(response.status).to eq(401)
      end

      it 'does not create a new ip_address' do
        expect {
          post :create, params: valid_params
        }.not_to change(IpAddress, :count)
      end
    end
  end
end

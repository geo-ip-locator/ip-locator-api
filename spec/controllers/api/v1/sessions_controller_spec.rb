require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user, email: 'test@example.com', password: 'password') }
    login_user

    context 'when valid params are passed' do
      it 'returns a success message' do
        post :create, params: { user: { email: user.email, password: user.password } }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ 'message' => I18n.translate('api.v1.sessions.success') })
      end
    end

    context 'when invalid params are passed' do
      it 'returns an error message' do
        post :create, params: { user: { email: user.email, password: 'wrongpassword' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'message' => I18n.translate('api.v1.sessions.failure') })
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    login_user

    it 'logs the user out' do
      delete :destroy
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({ 'message' => I18n.translate('api.v1.sessions.logged_out') })
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).with_message('user already exists') }
  end

  describe 'associations' do
    it { should have_many(:ip_addresses).dependent(:destroy) }
  end

  describe 'devise modules' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:confirmation_token).of_type(:string) }
    it { should have_db_column(:confirmed_at).of_type(:datetime) }
    it { should have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { should have_db_column(:unconfirmed_email).of_type(:string) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).with_message('user already exists') }

    it { should have_many(:ip_addresses).dependent(:destroy) }
  end

  describe 'db index' do
    it { is_expected.to have_db_index(:email).unique(true) }
  end
end

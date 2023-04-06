require 'rails_helper'

RSpec.describe IpAddress, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should belong_to(:user) }
    it { should allow_value('192.168.0.1').for(:address) }
    it { should_not allow_value('invalid ip').for(:address) }
    it { should_not allow_value('256.0.0.0').for(:address) }
    it { should_not allow_value('2001:db8::1').for(:address) }
  end
end

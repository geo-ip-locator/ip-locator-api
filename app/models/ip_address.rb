require 'resolv'

class IpAddress < ApplicationRecord
  belongs_to :user

  validates :address, format: { with: Resolv::IPv4::Regex }
end

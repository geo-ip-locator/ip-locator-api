class Api::V1::IpAddressesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  include ::Api::V1::IpAddressesServices

  def create
    @ip_address = current_user.ip_addresses.new(ip_address_params)

    if @ip_address.save
      location = get_location_from_geojs(@ip_address)

      render json: location, status: :created
    else
      render json: { errors: @ip_address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def ip_address_params
    params.require(:ip_address).permit(:address)
  end
end

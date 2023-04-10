require 'httparty'

module Api
  module V1
    module IpAddressesServices
      def get_location_from_geojs(ip)
        url = ENV['GEO_JS_API'] + "#{@ip_address.address}.json"
        response = HTTParty.get(url)

        if response.code == 200
          location = {
            city: response['city'],
            country: response['country']
          }
        else
          return nil
        end

        Rails.cache.write(@ip_address, location, expires_in: 1.month)
        return location
      end

    end
  end
end

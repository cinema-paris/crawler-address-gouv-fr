require 'faraday'
require 'json'
require 'crawler/address'

module Crawler
  module Address
    module Providers
      module GouvFr
        def self.resolve(street, zipcode, _city, _country)
          response = Faraday.get('https://api-adresse.data.gouv.fr/search',
            q: street,
            postcode: zipcode
          )

          return [] if !response.success? || !response.body

          json = JSON.parse(response.body)
          json['features'].map do |feature|
            geometry = feature['geometry']
            properties = feature['properties']

            {
              street: properties['name'],
              zipcode: properties['postcode'],
              city: properties['city'],
              country: 'fr',
              coordinates: {
                latitude: geometry['coordinates'].last,
                longitude: geometry['coordinates'].first
              }
            }
          end
        end
      end
    end
  end
end

Crawler::Address.add_provider :gouv_fr, score: 0.95, country: :fr

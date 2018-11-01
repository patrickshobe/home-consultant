require 'rails_helper'

describe 'Property Service' do
  it 'should find a property by address' do
    VCR.use_cassette('property_service_post') do
      address = '1860_south_marion_street-Denver-CO-80210'
      auth_token = ENV['TRELORA_TOKEN']

      property_service = PropertyService.new( address, auth_token )

      expect(property_service.client).to be_a(Client)
      expect(property_service.pricing_estimates).to be_a(PricingEstimates)
      expect(property_service.listing).to be_a(Listing)
    end
  end
end

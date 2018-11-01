require 'rails_helper'

describe 'TRELORA API Interface' do
  it 'should exist' do
    trelora = TreloraApiInterface.new
    expect(trelora).to be_a(TreloraApiInterface)
  end

  it 'should complete a successful member post' do
    VCR.use_cassette('trelora_member_post') do
      trelora = TreloraApiInterface.new
      body = { 'email':    ENV['TRELORA_EMAIL'],
               'password':  ENV['TRELORA_PASSWORD'] }

      member_response = trelora.post(:members, body)
      parsed_response = JSON.parse(member_response.body)
      expect(member_response.status).to eq(200)
      expect(parsed_response.keys.count).to eq(3)
      expect(parsed_response['data']['user'].keys.count).to eq(5)
      expect(parsed_response['data']['user'].keys).to include('HTTP_AUTH_TOKEN')
    end
  end
  it 'should complete a successful member post' do
    VCR.use_cassette('trelora_properties_post') do
      trelora = TreloraApiInterface.new
      body = {
                'HTTP_AUTH_TOKEN': ENV['TRELORA_TOKEN'],
                'address': '1860_south_marion_street-Denver-CO-80210'
      }
      properties_response = trelora.post(:properties, body)
      parsed_response = JSON.parse(properties_response.body)
      expect(properties_response.status).to eq(200)
      expect(parsed_response.keys.count).to eq(2)
      expect(parsed_response['result'].keys.count).to eq(3)
      expect(parsed_response['result'].keys).to include('listing')
    end
  end
end

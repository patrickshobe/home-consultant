require 'rails_helper'

describe 'Appointment Collection Service' do
  it 'should Collect appointment data' do
    VCR.use_cassette( 'trelora appointment post') do
      params = { consultation: {
        address:           '1860_south_marion_street-Denver-CO-80210',
        about_this_home:   'old and ugly',
        client_enthusiasm: 'low',
        commission:         2500,
        about_the_seller:   'Very nice people',
        credit_card:        '1234_1234_1234_1234',
        exp_date:           '01/18' } }

      collector = AppointmentCollector.new(params,
                                           ENV['TRELORA_TOKEN'],
                                           ENV['TRELORA_EMAIL'])


      expect(collector.about_this_home).to eq(params[:consultation][:about_this_home])
      expect(collector.client_enthusiasm).to eq(params[:consultation][:client_enthusiasm])
      expect(collector.commission).to eq(params[:consultation][:commission].to_s)
      expect(collector.about_the_seller).to eq(params[:consultation][:about_the_seller])
      expect(collector.credit_card).to eq('****_****_****_****')
      expect(collector.exp_date).to eq(params[:consultation][:exp_date])
    end
  end
end

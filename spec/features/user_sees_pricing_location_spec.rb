require 'rails_helper'

describe 'as a user' do
  describe 'visiting the pricing location screen' do
    it 'shows the pricing location details' do
      visit '/'

      fill_in 'user[address]', with: ENV['TRELORA_EMAIL']
      fill_in 'password', with: ENV['TRELORA_PASSWORD']

      VCR.use_cassette('testing location search two') do
        click_on 'Log in'
      end

      expect(current_path).to eq("/main_page")

      fill_in "address", with: "1860 south marion st Denver co 80210"

      VCR.use_cassette('find location testing two') do
        click_on "Find Location"
      end

      expect(page).to have_content('Name:')
      expect(page).to have_content('Email:')
      expect(page).to have_content('Phone:')
      expect(page).to have_content('Map:')
      expect(page).to have_content('Opted In:')
      expect(page).to have_content('Found Us:')
      expect(page).to have_content('Estimate:')
      expect(page).to have_content('Enthusiasm:')
      expect(page).to have_content('Timing:')
      expect(page).to have_content('Adopter Type:')
      expect(page).to have_content('Updates:')
      expect(page).to have_content('Stage:')
      expect(page).to have_content('Retainer:')
    end
  end
end

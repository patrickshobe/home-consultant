require 'rails_helper'

describe 'as a user' do
  describe 'visiting the collect form' do
    before(:each) do
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
    end
    it 'shows the collect form' do
      expect(page).to have_content('About the Home')
      expect(page).to have_content('Recommended List Price')
      expect(page).to have_content('Update Client Enthusiasm')
      expect(page).to have_content('Buyer Agent Commission')
      expect(page).to have_content('About the Seller')
      expect(page).to have_content('About the Seller')
      expect(page).to have_content('Credit Card Number')
      expect(page).to have_content('Credit Card Expiration Date')
      expect(page).to have_content('Finish')
    end
    it 'allows user to fill in the collect form' do
      fill_in :about_this_home, with: "1"
      fill_in :price, with: "2"
      fill_in :commission, with: "3"
      fill_in :about_the_seller, with: "4"
      fill_in :credit_card, with: "5"

      VCR.use_cassette("submit a collection form") do
      click_on "Finish"
      end

      expect(current_path).to eq(main_page_index_path)
      expect(page).to have_content("Name: Tyler")
    end
  end
end

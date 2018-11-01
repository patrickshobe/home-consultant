require 'rails_helper'

describe "user types in address" do
  it "shows property main page" do
    visit '/'

    fill_in 'user[address]', with: ENV['TRELORA_EMAIL']
    fill_in 'password', with: ENV['TRELORA_PASSWORD']

    VCR.use_cassette('testing location search') do
      click_on 'Log in'
    end

    expect(current_path).to eq("/main_page")

    fill_in "address", with: "1860 south marion st Denver co 80210"

    VCR.use_cassette('find location') do
      click_on "Find Location"
    end

  end
end

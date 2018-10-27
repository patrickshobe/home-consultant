require 'rails_helper'


describe "user visits address search page" do
  xit 'user can see address search page' do
    allow_any_instance_of(ApplicationController).to receive(:auth_token).and_return("this_is_a_very_simple_auth_token_string")

    visit "/search/new"

    expect(page).to have_content('Pricing Location Address')
    expect(page).to have_content('Location Address')
    expect(page).to have_button('Find Location')
  end
  xit "user types leaves address empty " do

    allow_any_instance_of(ApplicationController).to receive(:auth_token).and_return("this_is_a_very_simple_auth_token_string")

    visit "/search/new"

    fill_in 'address', with: ""

    VCR.use_cassette('empty address input') do
      click_on "Find Location"
    end

    expect(current_path).to eq(new_search_path)
    expect(page).to have_content("Address Empty.")
  end
  xit "user types invalid address" do
    allow_any_instance_of(ApplicationController).to receive(:auth_token).and_return("this_is_a_very_simple_auth_token_string")

    visit "/search/new"

    fill_in 'address', with: "123 Bad Address St. "

    VCR.use_cassette('invalid address input') do
      click_on "Find Location"
    end

    expect(current_path).to eq(new_search_path)
    expect(page).to have_content("Address Not Found")
  end
  xit "user types valid address" do
    allow_any_instance_of(ApplicationController).to receive(:auth_token).and_return("this_is_a_very_simple_auth_token_string")

    visit "/search/new"

    fill_in 'address', with: "1860 South Marion Street"

    VCR.use_cassette('valid address input') do
      click_on "Find Location"
    end

    expect(current_path).to eq('/main_page')
  end
end

require 'rails_helper'


describe "user visits address search page" do
  it "finds property " do

    allow_any_instance_of(ApplicationController).to receive(:auth_token).and_return("this_is_a_very_simple_auth_token_string")
    #     As an authenticated user I visit the address search page
    visit "/search/new"

    # When I type in a nil address and click search
    fill_in 'address', with: ""
    click_on "Find Location"

    # I am redirected back to the search page with an error message “Address Empty.”
    expect(current_path).to eq(new_search_path)
    expect(page).to have_content("Address Empty.")
    # save_and_open_page
  end


end

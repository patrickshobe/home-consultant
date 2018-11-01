require 'rails_helper'

describe 'user visits log in page' do
  it 'can see log in page' do
    visit '/'

    expect(page).to have_content('Home Consultant')
    expect(page).to have_content('Member Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  it "can log in a user with a correct password" do
    visit '/'

    fill_in 'user[address]', with: ENV['TRELORA_EMAIL']
    fill_in 'password', with: ENV['TRELORA_PASSWORD']

    VCR.use_cassette('valid login') do
      click_on 'Log in'
    end

    expect(current_path).to eq('/main_page')
    expect(page).to have_content('Pricing Location Address')
    expect(page).to have_button('Find Location')
  end

  it 'cannot log in a user with invalid password' do
    visit '/'

    fill_in 'user[address]', with: ENV['TRELORA_EMAIL']
    fill_in 'password', with: ''

    VCR.use_cassette('user_without_password') do
      click_on 'Log in'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content(
      '422 error. Member does not exist! 🔐. Invalid Login. Please try again.'
    )
    expect(page).to have_content('Home Consultant')
    expect(page).to have_content('Member Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  it 'cannot log in a user with invalid email' do
    visit '/'

    fill_in 'user[address]', with: 'steven'
    fill_in 'password', with: ENV['TRELORA_PASSWORD']

    VCR.use_cassette('user_without_email') do
      click_on 'Log in'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content(
      '422 error. Member does not exist! 🔐. Invalid Login. Please try again.'
    )
    expect(page).to have_content('Home Consultant')
    expect(page).to have_content('Member Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end
end

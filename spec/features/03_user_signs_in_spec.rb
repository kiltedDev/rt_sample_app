require 'rails_helper'

feature 'user sign in', %(
  As a user, I want to be able to log into my account.
) do

  before(:each) do
    @bob = create(:user)
    visit login_path
  end

  scenario 'user fails to enter log in information' do
    click_button "Log in"

    expect(page).to have_content("Invalid email/password combination")
  end

  scenario 'user logs in correctly' do
    fill_in 'Email', with: @bob.email
    fill_in 'Password', with: @bob.password

    click_button "Log in"
    expect(page).to have_content("Welcome to the Sample App")
    expect(page).to_not have_content("Invalid email/password combination")
  end
end

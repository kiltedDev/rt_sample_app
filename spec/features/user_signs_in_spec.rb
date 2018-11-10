require 'rails_helper'

feature 'user sign in', %(
  As a user, I want to be able to log into my account.
) do

  before(:each) do
    @bob = User.create()
    visit login_path
  end

  scenario 'user fails to enter log in information' do
    click_button "Log in"

    expect(page).to have_content("Invalid email/password combination")

    click_link "Home"
    expect(page).to have_content("Invalid email/password combination")
  end

  scenario 'user logs in correctly' do
  end
end

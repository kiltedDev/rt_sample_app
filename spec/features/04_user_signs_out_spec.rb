require 'rails_helper'

feature 'user sign in', %(
  As a user, I want to be able to log into my account.
) do

  before(:each) do
    @bob = create(:user)
    visit login_path

    fill_in 'Email', with: @bob.email
    fill_in 'Password', with: @bob.password

    click_button "Log in"
  end


  scenario 'user logs out' do
    click_link "Log out"

    expect(page).to have_content("Log in")
    expect(page).to_not have_content("Account")
  end
end

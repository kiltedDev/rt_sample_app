require 'rails_helper'

feature 'user sign up', %(
  As a user, I want to be able to sign up.
) do
  before(:each) do
    visit signup_path
  end

  scenario 'user fails to enter information' do
    click_button 'Create my account'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to_not have_content("Log Out")
  end

  scenario 'user enters correct information' do
    fill_in 'Name', with: 'First Last'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Create my account'

    expect(page).to have_content("Please check your email to activate your account.")
    # expect(page).to have_content("First Last")
    # expect(page).to have_content("Log out")
  end
end

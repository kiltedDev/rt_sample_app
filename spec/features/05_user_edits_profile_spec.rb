require 'rails_helper'

feature 'user edit account', %(
  As a user, I want to be able to edit my account.
) do

  before(:each) do
    @bob = create(:user)

    log_in_as @bob
    click_link "Settings"
  end

  scenario 'user fails to enter in correct information' do
    fill_in "Name", with: ""
    fill_in "Email", with: ""

    click_button 'Save changes'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to_not have_content "Password can't be blank"
  end

  scenario 'user edits profile correctly' do
    fill_in "Name", with: "Robert Johansson"
    fill_in "Email", with: "The.Bob@bob.net"

    click_button 'Save changes'

    expect(@bob.reload.name).to eq "Robert Johansson"
    expect(@bob.reload.email).to eq "the.bob@bob.net"
    expect(page).to have_content "Profile updated"
    expect(page).to_not have_content "Name can't be blank"
    expect(page).to_not have_content "Email can't be blank"
    expect(page).to_not have_content "Password can't be blank"
  end

  scenario 'redirects edit when not logged in' do
    click_link "Log out"
    visit edit_user_path @bob

    expect(page).to have_current_path(login_path)
  end

  scenario 'friendly forwarding after logging in correctly' do
    click_link "Log out"
    visit edit_user_path @bob

    fill_in 'Email', with: @bob.email
    fill_in 'Password', with: @bob.password

    click_button "Log in"

    expect(page).to have_current_path( edit_user_path(@bob) )

    fill_in "Name", with: "Robert Johansson"
    fill_in "Email", with: "The.Bob@bob.net"

    click_button 'Save changes'

    expect(@bob.reload.name).to eq "Robert Johansson"
    expect(@bob.reload.email).to eq "the.bob@bob.net"
  end

  scenario 'redirects edit when logged in as someone else' do
    @major = create(:user, :major)
    visit edit_user_path @major

    expect(page).to have_current_path(root_path)
  end
end

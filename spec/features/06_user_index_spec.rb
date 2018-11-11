require 'rails_helper'

feature 'user edit account', %(
  As a user, I want to be able to edit my account.
) do

  before(:each) do
    @bob = create(:user)
  end

  scenario 'redirects to login in order to view index when logged out' do
    visit users_path

    expect(page).to have_current_path(login_path)
  end

end

require 'rails_helper'

feature 'user edit account', %(
  As a user, I want to be able to edit my account.
) do

  before(:each) do
    @bob = create(:user)
    @butterworth = create(:user, :butterworth)
  end

  scenario 'destroys a user when it should' do
    log_in_as @butterworth
    visit users_path

    click_link("delete")

    expect(page).to_not have_content(@bob.name)
  end
end

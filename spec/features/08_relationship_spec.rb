require 'rails_helper'

feature 'following and followers', %(
  As a user, I want to be able to follow users and be followed.
) do

  before(:each) do
    @bob = create(:user)
    @butterworth = create(:user, :butterworth)
    @medeiros = create(:user, :major)
    @bob.follow(@medeiros)
  end

  scenario 'has followers' do
    log_in_as @medeiros
    visit followers_user_path(@medeiros)

    expect(page).to have_content(@bob.name)
  end

  scenario 'be following' do
    log_in_as @bob
    visit following_user_path(@bob)

    expect(page).to have_content(@medeiros.name)
  end
end

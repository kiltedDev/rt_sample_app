require 'rails_helper'

feature 'navigation', %(
  As a user, I want to click on links and have them go to not the wrong place.
) do
  before(:each) do
    visit root_path
  end

  scenario 'header should have correct links' do

    expect(page).to have_link("sample app", href: root_path)
    expect(page).to have_link("Home", href: root_path)
    expect(page).to have_link("Help", href: help_path)
    # expect(page).to have_link("Log In", href: login_path)

  end

  scenario 'Footer should have correct links' do
    expect(page).to have_link("Ruby on Rails Tutorial", href: "http://www.railstutorial.org/")
    expect(page).to have_link("About", href: about_path)
    expect(page).to have_link("Contact", href: contact_path)
  end

  scenario 'Footer should have correct links' do

    expect(page).to have_link("sample app", href: root_path)
    expect(page).to have_link("Home", href: root_path)
    expect(page).to have_link("Help", href: help_path)
    expect(page).to have_link("About", href: about_path)
    expect(page).to have_link("Contact", href: contact_path)
  end
end

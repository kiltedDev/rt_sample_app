require 'rails_helper'
# well, I get to write my own tests.  I like writing tests anyway.

feature "home page" do
  scenario "Sees home page and link to sources" do
    visit static_pages_home_path

    expect(page).to have_content "Sample App"
    expect(page).to have_link "Ruby on Rails Tutorial"
  end

  scenario "page has a title" do
    visit static_pages_home_path

    expect(page).to have_title 'Home | Ruby on Rails Tutorial Sample App'
  end

end

feature "help page" do
  scenario "sees help page with helpful resources" do
    visit static_pages_help_path

    expect(page).to have_content "Help"
    expect(page).to have_link "Rails Tutorial help page"
    expect(page).to have_link "Ruby on Rails Tutorial book"
  end

  scenario "page has a title" do
    visit static_pages_help_path

    expect(page).to have_title "Help | Ruby on Rails Tutorial Sample App"
  end
end

feature "about page" do
  scenario "sees about page with useful information" do
    visit static_pages_about_path

    expect(page).to have_content "About"
    expect(page).to have_link "Ruby on Rails Tutorial"
    expect(page).to have_link "book"
    expect(page).to have_link "screencast series"
    expect(page).to have_link "Ruby on Rails"
  end

  scenario "page has a title " do
    visit static_pages_about_path

    expect(page).to have_title 'About | Ruby on Rails Tutorial Sample App'
  end
end

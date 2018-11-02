require 'rails_helper'
# well, I get to write my own tests.  I like writing tests anyway.


feature "static pages" do
  scenario "Sees home page and link to sources" do
    visit static_pages_home_path

    expect(page).to have_content "Sample App"
    expect(page).to have_link "Ruby on Rails Tutorial"
  end
  scenario "sees help page with useful links" do

    visit static_pages_help_path

    expect(page).to have_content "Help"
    expect(page).to have_link "Rails Tutorial help page"
    expect(page).to have_link "Ruby on Rails Tutorial book"
  end
end

require 'rails_helper'
# well, I get to write my own tests.  I like writing tests anyway.
describe "static pages" do
    before(:each) do
      @base_title = "Ruby on Rails Tutorial Sample App"
    end

  feature "home page" do
    scenario "shows home page and link to sources" do
      visit static_pages_home_path

      expect(page).to have_content "Sample App"
      expect(page).to have_link "Ruby on Rails Tutorial"
    end

    scenario "has a title" do
      visit static_pages_home_path
      expect(page).to have_title "Home | #{@base_title}"
    end

  end

  feature "help page" do
    scenario "show help page with helpful resources" do
      visit static_pages_help_path

      expect(page).to have_content "Help"
      expect(page).to have_link "Rails Tutorial help page"
      expect(page).to have_link "Ruby on Rails Tutorial book"
    end

    scenario "has a title" do
      visit static_pages_help_path

      expect(page).to have_title "Help | #{@base_title}"
    end
  end

  feature "about page" do
    scenario "shows about page with useful information" do
      visit static_pages_about_path

      expect(page).to have_content "About"
      expect(page).to have_link "Ruby on Rails Tutorial"
      expect(page).to have_link "book"
      expect(page).to have_link "screencast series"
      expect(page).to have_link "Ruby on Rails"
    end

    scenario "has a title " do
      visit static_pages_about_path

      expect(page).to have_title "About | #{@base_title}"
    end
  end

  feature "contact page" do
    scenario "shows contact page with some people" do
      visit static_pages_contact_path

      expect(page).to have_content "Contact"
      expect(page).to have_link "contact page"
    end

    scenario "has a title" do
      visit static_pages_contact_path

      expect(page).to have_title "Contact | #{@base_title}"
    end
  end
end

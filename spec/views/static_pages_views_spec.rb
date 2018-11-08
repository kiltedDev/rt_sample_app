require 'rails_helper'
RSpec.describe "static_pages", type: :view do
    before(:each) do
      @base_title = "Ruby on Rails Tutorial Sample App"
    end

  feature "root" do
    scenario "directs to home" do
      visit root_path

      expect(page).to have_content "Sample App"
    end
  end

  feature "home page" do
    scenario "shows home page and link to sources" do
      visit home_path

      expect(page).to have_content "Sample App"
      expect(page).to have_link "Ruby on Rails Tutorial"
    end

    scenario "has a title" do
      visit home_path
      expect(page).to have_title "#{@base_title}"
    end

  end

  feature "help page" do
    scenario "show help page with helpful resources" do
      visit help_path

      expect(page).to have_content "Help"
      expect(page).to have_link "Rails Tutorial help page"
      expect(page).to have_link "Ruby on Rails Tutorial book"
    end

    scenario "has a title" do
      visit help_path

      expect(page).to have_title "Help | #{@base_title}"
    end
  end

  feature "about page" do
    scenario "shows about page with useful information" do
      visit about_path

      expect(page).to have_content "About"
      expect(page).to have_link "Ruby on Rails Tutorial"
      expect(page).to have_link "book"
      expect(page).to have_link "screencast series"
      expect(page).to have_link "Ruby on Rails"
    end

    scenario "has a title " do
      visit about_path

      expect(page).to have_title "About | #{@base_title}"
    end
  end

  feature "contact page" do
    scenario "shows contact page with some people" do
      visit contact_path

      expect(page).to have_content "Contact"
      expect(page).to have_link "contact page"
    end

    scenario "has a title" do
      visit contact_path

      expect(page).to have_title "Contact | #{@base_title}"
    end
  end
end

require 'rails_helper'
require 'cancancan'
require 'rolify'

RSpec.feature "CoolFeatures", type: :feature do
  context "visiting the site" do
    Steps "to visiting the site as an unauthorized user" do
      Given "I am on the landing page" do
        visit "/"
      end
      Then "I can see a list of apartments" do
        expect(page).to have_content "Apartments"
        expect(page).to have_content "Street1"
      end
    end
  end
  context "Becoming a site user" do
    Steps "To sign up" do
      Given "I am on the landing page" do
        visit "/"
      end
      And "I can see a Log In form" do
        expect(page).to have_content "Log in"
      end
      And "I can go to the sign up page" do
        click_on "Sign up"
        expect(page).to have_content "Password confirmation"
      end
      Then "I can fill out the form" do
        fill_in "Email", with: "this@this.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
      end
      Then "I can see a user created confirmation message" do
        expect(page).to have_content "Welcome! You have signed up successfully."
      end
    end
    Steps "to logging out" do
      Given "I am a registered user and logged in" do
        visit "/"
        click_on "Sign up"
        fill_in "Email", with: "this@this.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content "Logout"
      end
      Then"I can log out" do
        click_on "Logout"
        expect(page).to have_content "Log in"
      end
    end # close steps
    Steps "to viewing the apartment list as a renter" do
      Given "I am a registered user" do
        visit "/"
        click_on "Sign up"
        fill_in "Email", with: "this@this.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
      end
      Then "I can see a list of apartments" do
        expect(page).to have_content "Street"
        expect(page).to have_content "City"
        expect(page).to have_content "State"
        expect(page).to have_content "Country"
        expect(page).to have_content "Name"
        expect(page).to have_content "Phone number"
        expect(page).to have_content "Hours"
      end
      And "I cannot edit or delete content" do
        ability.should_not be_able_to(:destroy, Apartment.new)
      end
    end #close steps
  end # close context
  context "creating a new apartment listing" do
    Steps "to create a new apartment listing" do
      Given "I am a registered user" do
        visit "/"
        click_on "Sign up"
        fill_in "Email", with: "this@this.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
      end
      And "I can go to the new apartment page" do
        click_on "New Apartment"
        expect(page).to have_content "Back"
      end
      And "I can fill out the new apartment form" do
        fill_in "Street1", with: "Garnet Ave"
        fill_in "Street2", with: "Olney St"
        fill_in "City", with: "SD"
        fill_in "State", with: "CA"
        fill_in "Country", with: "USA"
        fill_in "Name", with: "Gretta's apartments"
        fill_in "Phone number", with: "555-5555"
        fill_in "Hours", with: "9am-5pm"

        click_on "Create Apartment"
        expect(page).to have_content "Apartment was successfully created."
      end
    end # close steps
  end  # close context
end # close feature

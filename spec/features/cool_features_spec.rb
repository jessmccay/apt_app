require 'rails_helper'

RSpec.feature "CoolFeatures", type: :feature do
  context "Visiting the landing page" do
    Steps "to viewing the apartment list" do
      Given "I am on the landing page" do
        visit "/"
      end
      "add some scenarios (or delete) #{__FILE__}"
      Then "I can see a list of apartments" do
        expect(page).to have_content "Street"
        expect(page).to have_content "City"
        expect(page).to have_content "State"
        expect(page).to have_content "Country"
        expect(page).to have_content "Name"
        expect(page).to have_content "Phone number"
        expect(page).to have_content "Hours"
      end
    end #close steps
  end # close context
  context "creating a new apartment listing" do
    Steps "to create a new apartment listing" do
      Given "I am on the new apartment page" do
        visit "/apartments/new"
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
    end
  end  # close context
end

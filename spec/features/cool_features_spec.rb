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
    end
  end
end

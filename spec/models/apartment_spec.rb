require 'rails_helper'

RSpec.describe Apartment, type: :model do
  user1 = User.new(email: "j@j.com", password: "password", password_confirmation: "password")
  user1.save
  it "should have an address" do
    paradise = Apartment.new(street1: "555 W Ave", street2: "Tom St", city: "San Diego", state: "CA", country: "USA", name: "Paradise Apartments", phone_number: 5555555, hours: "10am-6pm", user_id: user1.id)
    expect(paradise.save).to be true
  end

  it "should be savable and retrieved from the database" do
    paradise = Apartment.new(street1: "555 W Ave", street2: "Tom St", city: "San Diego", state: "CA", country: "USA", name: "Paradise Apartments", phone_number: 5555555, hours: "10am-6pm")
    paradise.save
    apt2 = Apartment.find_by_phone_number(5555555)
    expect(apt2.city).to eq "San Diego"
  end
end

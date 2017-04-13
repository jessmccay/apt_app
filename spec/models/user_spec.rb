require 'rails_helper'

RSpec.describe User, type: :model do
  it "should get saved to the database" do
    user = User.new(email: "mpsdevs@m.com", password: "password", password_confirmation: "password")
    expect(user.save).to be true
  end
  it "can be retrieved from the database" do
    user = User.new(email: "mpsdevs@m.com", password: "password", password_confirmation: "password")
    user.save
    user2= User.find_by_email("mpsdevs@m.com")
    expect(user2.email).to eq "mpsdevs@m.com"
  end
end

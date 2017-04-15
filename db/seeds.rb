# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
jess = User.new(email: "devs@gmail.com",  password: "password", password_confirmation: "password")

apt = Apartment.new(street1: "garnet", name: "great place", phone_number: "5555555", user_id: jess.id)

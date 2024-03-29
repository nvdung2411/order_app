# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: "food")
Category.create!(name: "drinks")

User.create! email: "admin@gmail.com", phone: "12345995", name: "admin", delivery_address: "HD", role: :admin, password: "1",
             confirmed_at: Time.zone.now
User.create! email: "user1@gmail.com", phone: "1234535", name: "user1", delivery_address: "HN", password: "1",
             confirmed_at: Time.zone.now
User.create! email: "user2@gmail.com", phone: "123453665", name: "user2", delivery_address: "HN", password: "1",
             confirmed_at: Time.zone.now

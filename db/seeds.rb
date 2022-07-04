# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

9.times do |index|
	Item.create! id: index, name: "Food #{index}", description: "Lorem ipsum dolor sit, amet consectetur adipisicin...",  price:1, category_id: 1, item_img_file_name: "f#{index}.jpg"
end

6.times do |index|
	Item.create! id: index, name: "Drinks #{index}", description: "Lorem ipsum dolor sit, amet consectetur adipisicin...",  price:1, category_id: 2, item_img_file_name: "d#{index}.png"
end

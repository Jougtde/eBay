# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 40.times do |n|
#     last_name  = Faker::Name.last_name
#     first_name = Faker::Name.first_name
#     address = Faker::Address.street_address + " " + Faker::Address.city + " " + Faker::Address.postcode
#     email = Faker::Internet.email(first_name + "." + last_name)
#     password = "password"
#     User.create!(last_name:  last_name,
#     first_name: first_name,
#     address: address,
#     email: email,
#     password: password,
#     password_confirmation: password)
# end

40.times do |n|
    title  = Faker::Commerce.product_name
    description = Faker::Commerce.product_name + " " + Faker::Commerce.department(5)
    price = Faker::Commerce.price
    user_id = rand(3..45)
    category_id = rand(1..4)
    img = "http://loremflickr.com/320/240/dog?random=" + String(user_id)
    Product.create!(title:  title,
    description: description,
    price: price,
    user_id: user_id,
    category_id: category_id,
    img: img)
end

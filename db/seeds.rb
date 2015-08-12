# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
800.times do |n|
    a = Account.new
    a.username  = Faker::Internet.user_name
    a.first_name =  Faker::Name.first_name
    a.last_name =  Faker::Name.last_name
    a.email =  Faker::Internet.email
    a.telephone_number = Faker::PhoneNumber.phone_number
    a.password = Faker::Internet.password(8)
    a.whoot = Faker::Lorem.paragraph(2)

    a.save
end

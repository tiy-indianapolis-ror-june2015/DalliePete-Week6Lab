# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# def make_user
100.times do |n|
    a = User.new
    a.username  = Faker::Internet.user_name
    a.first_name =  Faker::Name.first_name
    a.last_name =  Faker::Name.last_name
    a.email =  Faker::Internet.email
    a.telephone_number = Faker::PhoneNumber.phone_number
    a.password = Faker::Internet.password(8)

    a.save
end

10.times do |n|
    a = Post.new
    a.whoot = Faker::Lorem.paragraph(2)
    a.created_at = Faker::Date.between(15.days.ago, Date.today)
    a.user_id = n
    a.save

  end

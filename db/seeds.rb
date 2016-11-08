# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
puts "Generating Data for #{user.full_name}"
yesterday = Date.today - 1.day
one_month_past = yesterday - 1.month
one_month_past.upto yesterday do |date|
  4.times do
    user.readings.create(value: rand(300), created_at: date)
  end
end
puts 'All Done!'

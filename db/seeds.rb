# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Users

5.times do
	user = User.new(
		name:  Faker::Name.name,
		email:  Faker::Internet.email,
		bio:  Faker::Lorem.sentence,
		password:  Faker::Lorem.characters(10)
		)
	user.skip_confirmation!
	user.save!
end
users = User.all

# Create Items

20.times do
	item = Item.create!(
		user:  users.sample,
		name:  Faker::Lorem.sentence,
		body:  Faker::Lorem.sentence
		)
		# set created_at times
		item.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
	#	item.update_attributes!(due_date: rand(10.minutes .. 1.year).ago)

	end
items = Item.all

# Create an admin user
admin = User.new(
	name:  'Nick Wong',
	email:  'nickwong879@gmail.com',
	password:  'helloworld',
	role:  'admin',
	)
	admin.skip_confirmation!
	admin.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
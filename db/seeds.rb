# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def seed_books
	10.times do |i|
		Book.create(
			title: Faker::Book.title,
			author: Faker::Book.author,
			description: Faker::Lorem.paragraph,
			page_count: rand(100..300),
			image: Faker::File.file_name('path/to')
		)
	end
end

def seed_users
	10.times do |i|
		User.create(
			username: Faker::Internet.username,
			password: Faker::Internet.password
		)
	end
end

def seed_user_books
	100.times do |i|
		UserBook.create(
			user_id: rand(1...10),
			book_id: rand(1...10),
			currently_reading: Faker::Boolean.boolean(0)
		)
	end
end

puts "seed books"
seed_books

puts "seed users"
seed_users

puts "seed user books"
seed_user_books

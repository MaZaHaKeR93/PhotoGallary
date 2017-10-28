# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create!(name: 'Admin', email: 'admin@admin.ru', password: 'qweqweqwe', admin: true)
user = User.create!(name: 'User', email: 'user@user.ru', password: 'qweqweqwe')

10.times do 
	new_user = User.create!(name: Faker::Name.name, email: Faker::Internet.unique.email, password: 'qweqweqwe')
	
	5.times do
		new_picture = Picture.create!(title: Faker::Company.name, 
																	image: File.new("#{Rails.root}/public/uploads/default/big_default.jpg"),
																	user_id: new_user.id)
	end
end
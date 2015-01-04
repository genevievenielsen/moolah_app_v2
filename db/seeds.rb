# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new
u.first_name = "Genevieve"
u.last_name = "Nielsen"
u.grad_year = "2018"
u.university_id = 1
u.email = "genevieve@example.com"
u.password = "password"
u.save

u = University.new
u.name = "Awesome College"
u.location = "Santa Barbara"
u.owner_id = 1
u.save

c = Club.new
c.name = "Fun Club"
c.description = "Come have fun in the sun"
c.website = "www.google.com"
c.owner_id = 1
c.university_id = 1
c.save


i = Item.new
i.name = "Item"
i.price = 10.00
i.required = true
i.owner_id = 1
i.club_id = 1
i.category = "Merchandise"
i.university_id = 1
i.save


m = Membership.new
m.user_id = 1
m.club_id = 1
m.save

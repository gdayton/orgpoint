# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(:first_name => "Sammy", 
				   :last_name => "Slug", 
				   :email => "sslug@ucsc.edu", 
				   :company_id => 1, 
				   :password => "password", 
				   :password_confirmation => "password")
user.save

comp = Company.create(:title => "Barbara Floor & Tiling")
comp.save

loc = Location.create(:title => "San Diego, CA", :company_id => 1)
loc.save

dep = Department.create(:title => "Management", :company_id => 1)
dep.save


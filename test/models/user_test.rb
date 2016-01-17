require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "saves with valid attributes" do
		user = User.new(
			email: "glenn.dayton24@gmail.com",
			first_name: "Glenn",
			last_name: "Dayton",
			password: "this",
			password_confirmation: "this"
		)
		assert user.save
	end
	
	test "validates email presence" do
		@user1 = users(:user1)
		@user1.email = nil

		assert_not @user1.valid?
	end
	
	test "validates email uniqueness" do
		@user1 = users(:user1)
		@user2 = users(:user2)
		
		@user1.email = @user2.email
		
		assert_not @user1.valid?
	end
end

# Assertion Testing Info
# ==============================
# assert test
# 	If test expression is true
# assert_empty obj
#	If obj.empty? is true
# assert_equal expected, actual
# 	If expected == actual
# assert_includes collection, obj
#	If collection.includes?(obj) is true.
# assert_instance_of class, obj
# 	If obj.instance_of?(class) is true.
# assert_match regexp, string
# 	If string matches the regex
# assert_nil obj
#	If obj.nil? is true.
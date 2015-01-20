class User < ActiveRecord::Base

	#devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	has_one  :cart
	has_many :orders
	has_many :comments

end

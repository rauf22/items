class BlogPost < ActiveRecord::Base

	has_many :comments, as: :comentable
end
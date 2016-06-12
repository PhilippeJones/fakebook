class User < ActiveRecord::Base

	has_many :posts
  has_many :comments

	has_secure_password

	# Only allow letter, number, underscore and punctuation.
#	validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => false

end

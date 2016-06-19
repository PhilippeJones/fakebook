class User < ActiveRecord::Base

	has_many :posts
  has_many :comments

	has_secure_password

	# Only allow letter, number, underscore and punctuation.
#	validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => false

	has_attached_file :avatar, styles: { large: "1280x1280>", medium: "640x640#", small: "120x120#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

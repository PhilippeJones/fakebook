class User < ActiveRecord::Base

	has_many :posts
  has_many :comments

	has_secure_password

	has_attached_file :avatar, styles: { large: "1280x1280>", medium: "640x640#", small: "120x120#" }, default_url: "/images/avatar-missing-:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

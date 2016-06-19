class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

	has_attached_file :image, styles: { large: "1280x1280>", medium: "640x640#", thumb: "120x120#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	scope :ordered, -> { order("created_at ASC") }
end

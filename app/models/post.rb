class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

	scope :ordered, -> { order("created_at ASC") }
end

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true

  scope :ordered, -> { order("created_at ASC") }
  scope :recently_updated, -> { order("updated_at DESC") }
end

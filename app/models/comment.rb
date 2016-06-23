class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true

  after_save :update_post_last_comment_at

  scope :ordered, -> { order("created_at ASC") }
  scope :recently_updated, -> { order("updated_at DESC") }

  private

  def update_post_last_comment_at
    self.post.touch(:last_comment_at) if self.post
  end
end

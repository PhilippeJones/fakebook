class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

  validate :any_present

	has_attached_file :image, styles: { large: "1280x1280>", medium: "640x640#", thumb: "120x120#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	before_create :no_comments_yet

	scope :ordered, -> { order("created_at DESC") }

	private

  def no_comments_yet
    self.last_comment_at = self.created_at || Time.now
  end

	def any_present
		if %w(title content image).all?{ |attr| self[attr].blank? }
			errors.add :base, "Gotta fill something in"
		end
	end
end

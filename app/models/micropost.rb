class Micropost < ApplicationRecord
	belongs_to :user
	validates :context, length: {maximum: 140}, presence: true
	validates :user_id, presence: true

	def when
		"Posted on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
	end

	def by
		user = User.find(user_id)
		"By #{user.name}"
	end

end

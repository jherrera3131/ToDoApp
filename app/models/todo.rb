class Todo < ApplicationRecord
	belongs_to :user
	belongs_to :category

	validates :title, presence: true
	validates :user_id, presence: true
	validates :category_id, presence: true

	scope :completed, -> { where(completed: true) }
	scope :incomplete, -> { where(completed: false) }
	scope :priority, -> { where(priority: true) }
end

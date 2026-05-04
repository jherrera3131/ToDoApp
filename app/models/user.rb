class User < ApplicationRecord

	before_save {
		self.email = email.downcase
	}

	has_many :microposts, dependent: :destroy
	has_many :categories, dependent: :destroy
	has_many :todos, dependent: :destroy

	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
			length: { in: 6..50 }, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password

	def full_name
		"#{first_name} #{last_name}"
	end

	def details
		"Joined on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
	end

	def to_s
		"#{first_name} #{last_name} (@#{username})"
	end

	def post_count
		microposts.count
	end

end

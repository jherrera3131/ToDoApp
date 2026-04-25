module HomeHelper

	def get_stats(users,posts)
		phrase = "We proudly have #{users+posts} products featured!"
		"<h2 style='color:purple'>#{phrase}</h2>".html_safe
	end
end

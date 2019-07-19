class InputValidator
	def valid_page?(page)
		page.match(/^\/[a-z]+_?[a-z]+$/)
		
	end
end
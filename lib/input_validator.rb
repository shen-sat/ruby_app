class InputValidator
	def valid_page?(page)
		page.match(/^\/[a-z]+_?[a-z]+(\/[1-9]+)?$/)
		
	end
end
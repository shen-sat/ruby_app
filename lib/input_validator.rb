class InputValidator
	attr_accessor :correctly_formatted_logs, :incorrectly_formatted_logs

	def initialize
		@correctly_formatted_logs = []
		@incorrectly_formatted_logs = []
	end

	def valid_page?(page)
		page.match(/^\/[a-z]+_?[a-z]+(\/[1-9]+)?$/)
	end

	def valid_address?(address)
		address.match(/^[0-9][0-9][0-9](.[0-9][0-9][0-9]){3}$/)
	end
end
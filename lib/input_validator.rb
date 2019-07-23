class InputValidator
	attr_accessor :correctly_formatted_logs

	def initialize
		@correctly_formatted_logs = []
	end

	def valid_log?(log)
		log.match(/^\/[a-z]+_?[a-z]+(\/[1-9]+)? [0-9][0-9][0-9](.[0-9][0-9][0-9]){3}$/)
	end

	def save_log_to_list(log)
		correctly_formatted_logs << log if valid_log?(log) 
	end

end
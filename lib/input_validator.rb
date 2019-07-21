class InputValidator
	attr_accessor :correctly_formatted_logs, :incorrectly_formatted_logs

	def initialize
		@correctly_formatted_logs = []
		@incorrectly_formatted_logs = []
	end

	def valid_log?(log)
		log.match(/^\/[a-z]+_?[a-z]+(\/[1-9]+)? [0-9][0-9][0-9](.[0-9][0-9][0-9]){3}$/)
	end

	def save_log_to_list(log)
		valid_log?(log) ? correctly_formatted_logs << log : incorrectly_formatted_logs << log
	end

end
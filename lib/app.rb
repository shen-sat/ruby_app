class App

	def initialize(input_validator, page_aggregator)
		@input_validator = input_validator
		@page_aggregator = page_aggregator
	end

	def check_file(file)
		puts "Please provide correct file" if file.nil? || !File.exists?(file)
	end

end
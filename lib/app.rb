class App

	def initialize(input_validator, page_aggregator)
	end

	def run(file)
		puts "Please provide correct file" if file.nil? || !File.exists?(file)
	end

end
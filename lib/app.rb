class App

	def run(file)
		puts "Please provide correct file" if file.nil? || !File.exists?(file)
	end

end
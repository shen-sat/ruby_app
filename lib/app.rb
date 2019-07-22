class App

	def initialize(input_validator, page_aggregator)
		@input_validator = input_validator
		@page_aggregator = page_aggregator
	end

	def check_file(file)
		puts "Please provide correct file" if file.nil? || !File.exists?(file)
	end

	def check_logs(file)
		file.each do |log|
			@input_validator.save_log_to_list(log)
		end
	end

	def aggregate_logs(logs)
		@page_aggregator.aggregate(logs)
	end

	def sort_pages(pages)
		pages.sort_by { |page, no_of_views| no_of_views }.to_h
	end

	def display_results(total_page_views, unique_page_views)
		puts "Total page views:"
		total_page_views.each do |page, views|
			puts "#{page} #{views} visits"
		end
		puts "Unique page views:"
		unique_page_views.each do |page, views|
			puts "#{page} #{views} unique views"
		end
	end
end
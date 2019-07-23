class App

	def initialize(input_validator, page_aggregator)
		@input_validator = input_validator
		@page_aggregator = page_aggregator
	end

	def run(file)
		check_file(file)
		check_logs(file)
		correctly_formatted_logs = @input_validator.correctly_formatted_logs
		aggregate_logs(correctly_formatted_logs)
		total_views = @page_aggregator.total_views
		unique_views = @page_aggregator.unique_views
		total_views_sorted = sort_pages(total_views)
		unique_views_sorted = sort_pages(unique_views)
		display_results(total_views_sorted, unique_views_sorted)
	end

	def check_file(file)
		puts "Please provide correct file" if file.nil? || !File.exists?(file)
	end

	def check_logs(file)
		File.open(file).each do |log|
			@input_validator.save_log_to_list(log)
		end
	end

	def aggregate_logs(logs)
		@page_aggregator.aggregate(logs)
	end

	def sort_pages(pages)
		pages.sort_by { |page, no_of_views| no_of_views }.reverse.to_h
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
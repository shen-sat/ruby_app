class PageAggregator
	attr_accessor :total_views, :unique_views

	def initialize
		@total_views = {}
		@unique_views = {}
	end

	def aggregate(logs)
		logs.each do |log|
			page = log.split(' ')[0]
			@total_views[page].nil? ? @total_views[page] = 1 : @total_views[page] += 1 
		end
	end
end
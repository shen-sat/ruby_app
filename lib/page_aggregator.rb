class PageAggregator
	attr_accessor :total_views, :unique_views

	def initialize
		@total_views = {}
		@unique_views = {}
		@history = {}
	end

	def aggregate(logs)
		logs.each do |log|
			page = log.split(' ')[0]
			address = log.split(' ')[1]
			add_to_total(page)
			add_to_unique(page, address)
		end
	end

	def add_to_total(page)
		@total_views[page].nil? ? @total_views[page] = 1 : @total_views[page] += 1
	end

	def add_to_unique(page, address)
		if @history[page] != address
			@history[page] = address 
			@unique_views[page].nil? ? @unique_views[page] = 1 : @unique_views[page] += 1
		end
	end
end
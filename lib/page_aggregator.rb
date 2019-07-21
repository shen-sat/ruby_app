class PageAggregator
	attr_accessor :total_views, :unique_views

	def initialize
		@total_views = []
		@unique_views = []
	end
end
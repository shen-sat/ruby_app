require_relative '../lib/page_aggregator'

describe 'PageAggregator' do

	it 'initialize with empty lists for total views and unique views' do
		page_aggregator = PageAggregator.new
		expect(page_aggregator.total_views).to eq([])
		expect(page_aggregator.unique_views).to eq([])
	end
end
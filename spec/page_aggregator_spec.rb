require_relative '../lib/page_aggregator'

describe 'PageAggregator' do

	it 'initialize with empty lists for total views and unique views' do
		page_aggregator = PageAggregator.new
		expect(page_aggregator.total_views).to eq({})
		expect(page_aggregator.unique_views).to eq({})
	end

	it 'should record a log in total views' do
		page_aggregator = PageAggregator.new
		log = '/contact 184.123.665.067'
		logs = [log]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.total_views).to eq({ '/contact' => 1 }) 
	end

	it 'should record two logs with same page in total views' do
		page_aggregator = PageAggregator.new
		log_one = '/contact 184.123.665.067'
		log_two = '/contact 184.123.665.067'
		logs = [log_one, log_two]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.total_views).to eq({ '/contact' => 2 }) 
	end

	it 'should record two logs with different pages in total views' do
		page_aggregator = PageAggregator.new
		log_one = '/contact 184.123.665.067'
		log_two = '/help_page/1 126.318.035.038'
		logs = [log_one, log_two]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.total_views).to eq({ '/contact' => 1, '/help_page/1' => 1 }) 
	end

	it 'should record a log in unique views' do
		page_aggregator = PageAggregator.new
		log = '/contact 184.123.665.067'
		logs = [log]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.unique_views).to eq({ '/contact' => 1 }) 
	end

	it 'should record two logs with different pages in unique views' do
		page_aggregator = PageAggregator.new
		log_one = '/contact 184.123.665.067'
		log_two = '/help_page/1 126.318.035.038'
		logs = [log_one, log_two]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.unique_views).to eq({ '/contact' => 1, '/help_page/1' => 1 })
	end

	it 'should record two logs with the same page and different addresses in unique views' do
		page_aggregator = PageAggregator.new
		log_one = '/contact 184.123.665.067'
		log_two = '/contact 111.111.111.111'
		logs = [log_one, log_two]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.unique_views).to eq({ '/contact' => 2 })
	end

	it 'should record two logs with the same page and same address in unique views' do
		page_aggregator = PageAggregator.new
		log_one = '/contact 111.111.111.111'
		log_two = '/contact 111.111.111.111'
		logs = [log_one, log_two]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.unique_views).to eq({ '/contact' => 1 })
	end

	it 'should record two logs with different pages and same address in unique views' do
		page_aggregator = PageAggregator.new
		log_one = '/help_page/1 111.111.111.111'
		log_two = '/contact 111.111.111.111'
		logs = [log_one, log_two]
		page_aggregator.aggregate(logs)
		expect(page_aggregator.unique_views).to eq({ '/contact' => 1, '/help_page/1' => 1 })
	end






end
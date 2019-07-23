require_relative '../lib/input_validator'
require_relative '../lib/page_aggregator'
require_relative '../lib/app'

describe 'Application' do

 it 'should process and display three logs' do
 	Dir.chdir(File.dirname(__FILE__))
	file = File.open('../logs/three_logs.log')
	input_validator = InputValidator.new
	page_aggregator = PageAggregator.new
	app = App.new(input_validator, page_aggregator)
	expect { app.run(file) }.to output("Total page views:\n/help_page/1 2 visits\n/contact 1 visits\nUnique page views:\n/contact 1 unique views\n/help_page/1 1 unique views\n").to_stdout
 end
end

require_relative 'input_validator'
require_relative 'page_aggregator'
require_relative 'app'

input_validator = InputValidator.new
page_aggregator = PageAggregator.new
app = App.new(input_validator, page_aggregator)
app.run ARGV.first



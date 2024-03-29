require_relative '../lib/input_validator'

describe 'InputValidator' do

	before(:each) do
 		@input_validator = InputValidator.new
  	end

	it 'should initialize with empty lists of correctly formatted and incorrect formatted logs' do
		expect(@input_validator.correctly_formatted_logs).to eq([])
	end

	it 'should check log is in correct format' do
		valid_log_one = '/contact 184.123.665.067'
		valid_log_two = '/help_page/1 126.318.035.038'
		valid_log_three = '/help_page/22 126.318.035.038'
		invalid_log_one = ''
		invalid_log_two = '/help_page'
		invalid_log_three = '/help_page/'
		invalid_log_four = '/help_page/a'
		invalid_log_five = '/help_page/1'
		invalid_log_six = '/help_page/1 '
		invalid_log_seven = '/help_page/1 126'
		invalid_log_eight = '/help_page/1 126.318'
		invalid_log_nine = '/help_page/1 126.318.035'
		expect(@input_validator.valid_log?(valid_log_one)).to be_truthy
		expect(@input_validator.valid_log?(valid_log_two)).to be_truthy
		expect(@input_validator.valid_log?(valid_log_three)).to be_truthy
		expect(@input_validator.valid_log?(invalid_log_one)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_two)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_three)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_four)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_five)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_six)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_seven)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_eight)).to be_falsey
		expect(@input_validator.valid_log?(invalid_log_nine)).to be_falsey
	end

	it 'should save a correct log to the list of correctly formatted logs' do
		log = double('log')
		allow(@input_validator).to receive(:valid_log?).and_return(true)
		@input_validator.save_log_to_list(log)
		expect(@input_validator.correctly_formatted_logs).to eq([log])
	end

end
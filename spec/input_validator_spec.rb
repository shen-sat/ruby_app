require_relative '../lib/input_validator'

describe 'InputValidator' do

	it 'should check if page section is in correct format' do
		input_validator = InputValidator.new
		correct_page_one = '/contact'
		correct_page_two = '/help_page'
		incorrect_page_one = 'contact'
		incorrect_page_two = '/1'
		expect(input_validator.valid_page?(correct_page_one)).to be_truthy
		expect(input_validator.valid_page?(correct_page_two)).to be_truthy
		expect(input_validator.valid_page?(incorrect_page_one)).to be_falsey
		expect(input_validator.valid_page?(incorrect_page_two)).to be_falsey
	end

	it 'should check if page number is in correct format' do
		input_validator = InputValidator.new
		correct_page_one = '/about/1'
		correct_page_two = '/help_page/22'
		incorrect_page_one = '/about/'
		incorrect_page_two = '/about/a'
		expect(input_validator.valid_page?(correct_page_one)).to be_truthy
		expect(input_validator.valid_page?(correct_page_two)).to be_truthy
		expect(input_validator.valid_page?(incorrect_page_one)).to be_falsey
		expect(input_validator.valid_page?(incorrect_page_two)).to be_falsey
	end



end
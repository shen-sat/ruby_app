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

	it 'should check if the address is in a valid format' do
		input_validator = InputValidator.new
		correct_address = '126.318.035.038'
		incorrect_address_one = '126318035038'
		incorrect_address_two = '1260.3180.0350.0380'
		incorrect_address_three = '12.31.03.03'
		incorrect_address_four = '/contact'
		expect(input_validator.valid_address?(correct_address)).to be_truthy
		expect(input_validator.valid_address?(incorrect_address_one)).to be_falsey
		expect(input_validator.valid_address?(incorrect_address_two)).to be_falsey
		expect(input_validator.valid_address?(incorrect_address_three)).to be_falsey
		expect(input_validator.valid_address?(incorrect_address_four)).to be_falsey
	end



end
require_relative '../lib/app.rb'

describe 'App' do

	before(:each) do
 		@input_validator = double('input_validator')   	
 		@page_aggregator = double('page_aggregator')   	
    	@app = App.new(@input_validator, @page_aggregator)
  	end

	it 'should puts an error message if file is not provided' do
		file = double('file')
		allow(file).to receive(:nil?).and_return(true)
		expect { @app.check_file file }.to output("Please provide correct file\n").to_stdout
	end

	it 'should puts an error message if file does not exist' do
		file = double('file')
		allow(File).to receive(:exists?).and_return(false)
		expect { @app.check_file file }.to output("Please provide correct file\n").to_stdout
	end

	it 'should use input validator to check logs format' do
		file = double('file')
		log = double('log')
		allow(file).to receive(:each).and_yield(log)
		expect(@input_validator).to receive(:save_log_to_list).with(log)
		@app.check_logs(file)
	end

end
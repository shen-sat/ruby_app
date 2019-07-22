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
	
end
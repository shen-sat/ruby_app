require_relative '../lib/app.rb'

describe 'App' do

	it 'should puts an error message if file is not provided' do
		app = App.new
		file = double('file')
		allow(file).to receive(:nil?).and_return(true)
		expect { app.run file }.to output("Please provide correct file\n").to_stdout
	end

	it 'should puts an error message if file does not exist' do
		app = App.new
		file = double('file')
		allow(File).to receive(:exists?).and_return(false)
		expect { app.run file }.to output("Please provide correct file\n").to_stdout
	end

end
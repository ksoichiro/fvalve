require 'rubygems'
require 'fileutils'
require 'fvalve'

describe Fvalve::Fvalve, "when correctly initialized" do

	before do
		$stdout = File.new('/dev/null', 'w')

		if Dir.exists?('tmp')
			FileUtils.rm_rf('tmp')
		end
		Dir.mkdir('tmp')
		20.times do |i|
			File.open("tmp/#{20140401 + i}.log", "w").close()
		end
		@valve = Fvalve::Fvalve.new
		@valve.instance_variable_set(:@target_dir, 'tmp')
		@valve.instance_variable_set(:@pattern, '*.log')
		@valve.instance_variable_set(:@generations, '3')
	end

	it "should leave 3 files" do
		@valve.execute
		Dir.glob('tmp/*.log').length == 3
	end

	after do
		FileUtils.rm_rf('tmp')
		$stdout = STDOUT
	end

end

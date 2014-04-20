require 'fileutils'
require './lib/rotate.rb'

describe Rotater, "when correctly initialized" do

	before do
		$stdout = File.new('/dev/null', 'w')

		if Dir.exists?('tmp')
			FileUtils.rm_rf('tmp')
		end
		Dir.mkdir('tmp')
		20.times do |i|
			File.open("tmp/#{20140401 + i}.log", "w").close()
		end
		@rotater = Rotater.new
		@rotater.instance_variable_set(:@target_dir, 'tmp')
		@rotater.instance_variable_set(:@pattern, '*.log')
		@rotater.instance_variable_set(:@generations, '3')
	end

	it "should leave 3 files" do
		@rotater.rotate
		Dir.glob('tmp/*.log').length == 3
	end

	after do
		FileUtils.rm_rf('tmp')
		$stdout = STDOUT
	end

end

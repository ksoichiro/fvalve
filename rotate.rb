#!/usr/bin/env ruby

require './lib/rotate.rb'

if ARGV.length < 3 then
	Rotater.loge "Invalid params: example: ./rotate.rb target '*.log' 3"
	exit 1
end

r = Rotater.new
r.instance_variable_set(:@target_dir, ARGV[0])
r.instance_variable_set(:@pattern, ARGV[1])
r.instance_variable_set(:@generations, ARGV[2])
r.rotate


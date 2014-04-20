require 'rake/testtask'

desc 'Rotate files. example: rake "rotate[target, \'*.log\', 3]"'
task :rotate, :target_dir, :pattern, :generations do |t, args|
	sh "ruby ./rotate.rb #{args.target_dir} #{args.pattern} #{args.generations}"
end

task :default => :test

Rake::TestTask.new

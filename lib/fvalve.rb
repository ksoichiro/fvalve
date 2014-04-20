require "fvalve/version"

module Fvalve
	class Fvalve
		LOG_INFO = 'INFO'
		LOG_WARN = 'WARN'
		LOG_ERROR = 'ERROR'
		def self.log(msg, level = LOG_INFO)
			t = Time.now
			puts "[#{t.strftime("%Y/%m/%d %H:%M:%S %Z")}] [#{level}] #{msg}"
		end
	
		def self.logi(msg)
			self.log msg, LOG_INFO
		end
	
		def self.logw(msg)
			self.log msg, LOG_WARN
		end
	
		def self.loge(msg)
			self.log msg, LOG_ERROR
		end
	
		def initialize
			@target_dir = nil
			@pattern = "*.log"
			@generations = -1
		end
	
		def execute
			Fvalve.logi "Started."
			Fvalve.logi "Parameters:"
			Fvalve.logi "  target_dir: #{@target_dir}"
			Fvalve.logi "  pattern: #{@pattern}"
			Fvalve.logi "  generations: #{@generations}"
	
			if !Dir.exist?(@target_dir) then
				Fvalve.loge "Target directory not found: #{@target_dir}"
				exit 1
			end
	
			cwd = Dir.getwd
			Dir.chdir(@target_dir)
			gen = 0
			deleted = 0
			Dir.glob(@pattern).sort {|a, b| b <=> a}.each do |f|
				gen = gen + 1
				if @generations.to_i < gen then
					Fvalve.logi "Remove file: #{f}"
					File.delete f
					deleted = deleted + 1
				end
			end
			Dir.chdir(cwd)
	
			Fvalve.logi "Deleted #{deleted} file(s)."
			Fvalve.logi "Done."
		end
	end
end

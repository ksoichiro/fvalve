class Rotater
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

	def rotate
		Rotater.logi "Started."
		Rotater.logi "Parameters:"
		Rotater.logi "  target_dir: #{@target_dir}"
		Rotater.logi "  pattern: #{@pattern}"
		Rotater.logi "  generations: #{@generations}"

		if !Dir.exist?(@target_dir) then
			Rotater.loge "Target directory not found: #{@target_dir}"
			exit 1
		end

		Dir.chdir(@target_dir)
		gen = 0
		deleted = 0
		Dir.glob(@pattern).sort {|a, b| b <=> a}.each do |f|
			gen = gen + 1
			if @generations.to_i < gen then
				Rotater.logi "Remove file: #{f}"
				File.delete f
				deleted = deleted + 1
			end
		end

		Rotater.logi "Deleted #{deleted} file(s)."
		Rotater.logi "Done."
	end
end

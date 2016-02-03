module BackupRepos
  class Shell
    def initialize(opts = {})
      @debug = opts[:debug] || false
    end

    def run(command)
      log_command(command)
      execute_command(command)
    end

    private

    def debug?
      @debug || BackupRepos.config.debug
    end

    def execute_command(command)
      IO.popen(command, 'r') do |io|
        output = io.read
        log_output(output)
      end
    end

    def log_command(command)
      return unless debug?

      puts "EXECUTING: #{command}"
    end

    def log_output(output)
      return unless debug?

      puts 'OUTPUT:'
      puts output
    end
  end
end

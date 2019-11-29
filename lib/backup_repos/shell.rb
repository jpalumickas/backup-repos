# frozen_string_literal: true

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
      output = IO.popen(command, 'r', err: %i[child out]) do |io|
        output = io.read
        log_output(output)
        output
      end

      [success?(output), output]
    end

    def success?(output)
      return false if output =~ /remote error\:/
      return false if output =~ /fatal\:/

      true
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

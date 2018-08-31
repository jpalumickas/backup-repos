require 'commander'

require_relative 'cli/setup'

module BackupRepos
  class Commander
    include ::Commander::Methods

    def run
      program :name, 'Backup Repos'
      program :version, BackupRepos::VERSION
      program :description, 'Backup your repositories to specified directory.'

      command :backup do |c|
        c.syntax = 'backup-repos backup'
        c.description = 'Backup your repositories.'

        c.option '--backup_root DIR', String, 'Backup destination directory'
        c.option '--debug', String, 'Show debug information'
        c.option '--only LIST', String, 'Only backup specified repos or orgs. Separate by comma.'

        c.action do |args, options|
          BackupRepos.config_options = options

          if args[0] && %w(github bitbucket gitlab).include?(args[0].downcase)
            BackupRepos::Backup.new.send("process_#{args[0]}")
          else
            BackupRepos::Backup.new.process
          end
        end
      end

      command :setup do |c|
        c.syntax = 'backup-repos setup'
        c.description = 'Setup settings.'

        c.option '--debug', String, 'Setup with debug flag.'

        c.action do |_args, options|
          BackupRepos::CLI::Setup.new(options).call
        end
      end

      run!
    end
  end
end

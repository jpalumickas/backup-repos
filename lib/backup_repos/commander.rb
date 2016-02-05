require 'commander'

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

        c.action do |_args, options|
          BackupRepos.config_options = options
          BackupRepos::Backup.new.process
        end
      end

      run!
    end
  end
end

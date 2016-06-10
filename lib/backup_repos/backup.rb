require_relative 'performers/base_git'
require_relative 'backup_github'
require_relative 'backup_bitbucket'
require_relative 'backup_gitlab_endpoint'
require_relative 'backup_gitlab'

module BackupRepos
  class Backup
    attr_reader :errors

    def initialize
      @errors = []

      validate!
    end

    def process
      return unless valid?

      BackupGithub.new.process
      BackupBitbucket.new.process
      BackupGitlab.new.process
    end

    def valid?
      errors.blank?
    end

    private

    def validate!
      validate_backup_dir!
      inform_about_error! unless valid?
    end

    def validate_backup_dir!
      backup_root = BackupRepos.config.backup_root

      if backup_root.blank?
        errors.push('Backup directory is not specified.') && return
      end

      return if File.exist?(backup_root)
      errors << 'Backup directory is not exists.'
    end

    def inform_about_error!
      puts errors.first.red
    end
  end
end

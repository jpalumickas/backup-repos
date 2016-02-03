require_relative 'performers/base'
require_relative 'backup_github'

module BackupRepos
  class Backup
    def initialize
      backup_root = BackupRepos.config.backup_root
      fail 'Backup root is not specified!' if backup_root.blank?
    end

    def process
      BackupGithub.process
    end
  end
end

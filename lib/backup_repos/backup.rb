module BackupRepos
  class Backup
    def initialize
      backup_root = BackupRepos.config.backup_root
      fail 'Backup root is not specified!' if backup_root.blank?
    end

    def backup
      Github::Backup.process
    end
  end
end

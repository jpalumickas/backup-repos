module BackupRepos
  module Performers
    class Base
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def backup
        if File.exist?(full_backup_path)
          update_repo
        else
          clone_repo
        end
      end

      def clone_url
        fail 'Not implemented'
      end

      def backup_path
        fail 'Not implemented'
      end

      private

      def clone_repo
        BackupRepos.shell.run(
          "git clone --mirror -n #{clone_url} #{full_backup_path}")
      end

      def update_repo
        FileUtils.cd(full_backup_path) do
          BackupRepos.shell.run('git remote update')
        end
      end

      def full_backup_path
        backup_root = BackupRepos.config.backup_root
        fail 'Backup root is not specified!' if backup_root.blank?

        File.join(backup_root, backup_path)
      end
    end
  end
end

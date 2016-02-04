module BackupRepos
  module Performers
    class BaseGit
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def backup
        print "Backing up #{backup_path.yellow}: "

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
        success, _output = BackupRepos.shell.run(
          "git clone --mirror -n #{clone_url} #{full_backup_path}")
        puts success ? 'Successfuly cloned'.green : 'Failed to clone'.red
      end

      def update_repo
        FileUtils.cd(full_backup_path) do
          success, _output = BackupRepos.shell.run('git remote update')
          puts success ? 'Successfuly updated'.green : 'Failed to update'.red
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

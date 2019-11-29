# frozen_string_literal: true

module BackupRepos
  module Performers
    class BaseGit
      attr_reader :params, :options

      def initialize(params, options = {})
        @params = params
        @options = options
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
        raise 'Not implemented'
      end

      def backup_path
        raise 'Not implemented'
      end

      def provider
        raise 'Not implemented'
      end

      private

      def clone_repo
        success, _output = BackupRepos.shell.run(
          "git clone --mirror -n #{clone_url} #{full_backup_path}"
        )

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
        raise 'Backup root is not specified!' if backup_root.blank?

        File.join(backup_root, provider, backup_path)
      end
    end
  end
end

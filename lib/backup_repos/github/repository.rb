module BackupRepos
  module Github
    class Repository
      attr_reader :repo

      def initialize(repo)
        @repo = repo
      end

      def backup
        if File.exist?(full_backup_path)
          update_repo
        else
          clone_repo
        end
      end

      private

      def clone_url
        repo.ssh_url
      end

      def backup_path
        "#{repo.full_name}.git"
      end

      def clone_repo
        BackupRepos.shell.run(
          "git clone --mirror -n #{clone_url} #{backup_path}")
      end

      def update_repo
        FileUtils.cd(full_backup_path) do
          BackupRepos.shell.run('git remote update')
        end
      end

      def full_backup_path
        File.join(config.backup_root, backup_path)
      end
    end
  end
end

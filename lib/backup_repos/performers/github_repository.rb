module BackupRepos
  module Performers
    class GithubRepository < BaseGit
      def clone_url
        params.ssh_url
      end

      def backup_path
        "#{params.full_name}.git"
      end
    end
  end
end

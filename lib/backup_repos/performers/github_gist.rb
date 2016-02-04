module BackupRepos
  module Performers
    class GithubGist < BaseGit
      def provider
        'GitHub'
      end

      def clone_url
        params.git_pull_url
      end

      def backup_path
        if params.owner
          "#{params.owner.login}/gists/#{params.id}.git"
        else
          "anonymous/gists/#{params.id}.git"
        end
      end
    end
  end
end

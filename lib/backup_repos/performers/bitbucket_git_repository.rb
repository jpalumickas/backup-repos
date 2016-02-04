module BackupRepos
  module Performers
    class BitbucketGitRepository < BaseGit
      def provider
        'BitBucket'
      end

      def clone_url
        "git@bitbucket.org:#{full_name}.git"
      end

      def backup_path
        "#{full_name}.git"
      end

      private

      def full_name
        "#{params.owner}/#{params.slug}"
      end
    end
  end
end

module BackupRepos
  module Performers
    class BitbucketGitWiki < BaseGit
      def provider
        'BitBucket'
      end

      def clone_url
        "git@bitbucket.org:#{full_name}.git/wiki"
      end

      def backup_path
        "#{full_name}.wiki.git"
      end

      private

      def full_name
        "#{params.owner}/#{params.slug}"
      end
    end
  end
end

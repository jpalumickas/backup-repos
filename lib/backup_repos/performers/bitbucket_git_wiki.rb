# frozen_string_literal: true

module BackupRepos
  module Performers
    class BitbucketGitWiki < BitbucketGitRepository
      def clone_url
        "git@bitbucket.org:#{full_name}.git/wiki"
      end

      def backup_path
        "#{full_name}.wiki.git"
      end
    end
  end
end

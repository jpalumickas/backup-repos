# frozen_string_literal: true

module BackupRepos
  module Performers
    class GitlabRepository < BaseGit
      def provider
        'GitLab'
      end

      def clone_url
        params.ssh_url_to_repo
      end

      def backup_path
        "#{options[:endpoint_host]}/#{params.path_with_namespace}.git"
      end
    end
  end
end

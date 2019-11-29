# frozen_string_literal: true

module BackupRepos
  class BackupGitlab
    def process
      endpoints.each do |endpoint|
        BackupRepos::BackupGitlabEndpoint.new(endpoint).call
      end
    end

    private

    def endpoints
      BackupRepos.config.gitlab.to_a
    end
  end
end

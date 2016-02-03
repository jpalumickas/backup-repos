require_relative 'performers/github_repository'
require_relative 'performers/github_wiki'

module BackupRepos
  class BackupGithub
    class << self
      def process
        new.process
      end
    end

    def process
      process_repositories
      process_wiki
    end

    def repos
      @repos ||= client.repos
    end

    def client
      @client ||= Octokit::Client.new(
        access_token: BackupRepos.config.github.access_token)
    end

    private

    def process_repositories
      Performers::GithubRepository.new(repos.first).backup
    end

    def process_wiki
      repo = repos.detect(&:has_wiki?)
      Performers::GithubWiki.new(repo).backup

      # repos.select(&:has_wiki?).each do |repo_params|
      #   Performers::GithubWiki.new(repo_params).backup
      # end
    end
  end
end

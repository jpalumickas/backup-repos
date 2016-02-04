require 'octokit'

require_relative 'performers/github_repository'
require_relative 'performers/github_wiki'
require_relative 'performers/github_gist'

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
      process_gist
    end

    def repos
      @repos ||= client.repos
    end

    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    private

    def access_token
      BackupRepos.config.github_access_token
    end

    def process_repositories
      Performers::GithubRepository.new(repos.first).backup

      # repos.each do |repo_params|
      #   Performers::GithubRepository.new(repo_params).backup
      # end
    end

    def process_wiki
      repo = repos.detect(&:has_wiki?)
      Performers::GithubWiki.new(repo).backup

      # repos.select(&:has_wiki?).each do |repo_params|
      #   Performers::GithubWiki.new(repo_params).backup
      # end
    end

    def process_gist
      # client.gists.each do |gist_params|
      #   Performers::GithubGist.new(gist_params).backup
      # end
    end
  end
end

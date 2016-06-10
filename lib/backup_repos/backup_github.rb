require 'octokit'

require_relative 'performers/github_repository'
require_relative 'performers/github_wiki'
require_relative 'performers/github_gist'

module BackupRepos
  class BackupGithub
    def process
      process_repositories
      process_wiki
      process_gist
    end

    def repos
      @repos ||= client.repos.reject { |repo| exclude_repo?(repo) }
    end

    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    private

    def access_token
      BackupRepos.config.github_access_token
    end

    def process_repositories
      repos.each do |repo_params|
        Performers::GithubRepository.new(repo_params).backup
      end
    end

    def process_wiki
      repos.select(&:has_wiki?).each do |repo_params|
        Performers::GithubWiki.new(repo_params).backup
      end
    end

    def process_gist
      client.gists.each do |gist_params|
        Performers::GithubGist.new(gist_params).backup
      end
    end

    def exclude_repos
      @exclude_repos ||= BackupRepos.config.github.exclude.to_a.map(&:downcase)
    end

    def exclude_repo?(repo)
      return false if exclude_repos.blank?

      repo_owner = repo.owner.login.to_s.downcase
      full_name = repo.full_name.to_s.downcase

      exclude_repos.include?(repo_owner) || exclude_repos.include?(full_name)
    end
  end
end

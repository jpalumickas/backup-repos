require 'bitbucket_rest_api'

require_relative 'performers/bitbucket_git_repository'
require_relative 'performers/bitbucket_git_wiki'

module BackupRepos
  class BackupBitbucket
    class << self
      def process
        new.process
      end
    end

    def process
      ask_credentials
      process_git_repositories
      process_git_wikis
    end

    private

    def client
      @client ||= ::BitBucket.new(login: @username, password: @password)
    end

    def ask_credentials
      cli = HighLine.new
      @username = cli.ask('BitBucket Username: ')
      @password = cli.ask('BitBucket Password:  ') { |q| q.echo = false }
    end

    def process_git_repositories
      repo = git_repos.first

      Performers::BitbucketGitRepository.new(repo).backup

      # git_repos.each do |repo_params|
      #   Performers::BitbucketGitRepository.new(repo_params).backup
      # end
    end

    def process_git_wikis
      wiki_repos = git_repos.select(&:has_wiki)

      wiki_repos.each do |repo_params|
        Performers::BitbucketGitWiki.new(repo_params).backup
      end
    end

    def git_repos
      repos.select { |repo| repo.scm == 'git' }
    end

    def repos
      @repos ||= client.repos.list
    end
  end
end

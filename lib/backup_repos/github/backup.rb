module BackupRepos
  module Github
    class Backup
      class << self
        def process
          new.process
        end
      end

      def process
        Repository.new(repos.first).backup
      end

      def repos
        @repos ||= client.repos
      end

      def client
        @client ||= Octokit::Client.new(
          access_token: BackupRepos.config.github.access_token)
      end
    end
  end
end

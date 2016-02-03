module BackupRepos
  module Github
    class Backup
      def repos
        @repos ||= client.repos
      end

      def client
        @client ||= Octokit::Client.new(access_token: config.token)
      end
    end
  end
end

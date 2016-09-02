module BackupRepos
  module CLI
    class Setup
      attr_reader :options, :config

      def initialize(options)
        @options = options
        @config = {}
      end

      def call
        configure_from_options
        configure_backup_directory
        configure_providers
        write_config
      end

      private

      def write_config
        File.write(BackupRepos.config.config_file, YAML.dump(config))
      end

      def configure_from_options
        @config[:debug] = true if options.debug
      end

      def configure_providers
        if cli.agree '* Are you want to backup GitHub repositories?'
          configure_github
        end

        if cli.agree '* Are you want to backup BitBucket repositories?'
          configure_bitbucket
        end
      end

      def configure_backup_directory
        cli.say '* To what directory you want to backup?'
        @backup_directory = cli.ask '  Backup directory: ' do |q|
          q.readline = true
          q.completion = Pathname
          q.directory = Pathname.new('/')
          q.default = BackupRepos.config.backup_root
          q.glob = '*'
        end

        check_backup_directory
      end

      def check_backup_directory
        @backup_directory = File.expand_path(@backup_directory)

        unless File.exist?(@backup_directory)
          if cli.agree "Directory '#{@backup_directory} not exists... Want to create it?"
            FileUtils.mkdir_p(@backup_directory)
          else
            configure_backup_directory
          end
        end

        @config[:backup_root] = @backup_directory
      end

      def configure_github
        @config[:github] ||= {}

        cli.say '  What is your GitHub access token?'
        access_token = cli.ask '    Access Token: '
        exclude_repositories = cli.ask(
          '   Exclude repositories (separate by space):  ', Array
        )

        @config[:github][:access_token] = access_token if access_token.present?

        if exclude_repositories.present?
          @config[:github][:exclude] = exclude_repositories
        end
      end

      def configure_bitbucket
        cli.say '  What is your BitBucket credentials?'
        username = ask('    Username:  ')
        password = ask('    Password:  ') { |q| q.echo = '*' }

        if username.present? && password.present?
          @config[:bitbucket] ||= {}
          @config[:bitbucket][:username] = username
          @config[:bitbucket][:password] = password
        end
      end

      def cli
        @cli ||= HighLine.new
      end
    end
  end
end

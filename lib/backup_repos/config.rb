require 'yaml'
require 'hashie/mash'

module BackupRepos
  class Config
    def initialize
      unless File.exist?(config_file)
        fail "No configuration file: #{config_file}"
      end
    end

    def config
      @config ||= Hashie::Mash.new(YAML.load_file(config_file))
    end

    def backup_root
      return if config.backup_root.blank?

      File.expand_path(config.backup_root)
    end

    def method_missing(name, *_args)
      config[name.to_s]
    end

    private

    def config_file
      File.join(Dir.home, '.backup_repos')
    end
  end
end

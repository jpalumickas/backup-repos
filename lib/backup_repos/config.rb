# frozen_string_literal: true

require 'yaml'
require 'hashie/mash'

module BackupRepos
  class Config
    attr_reader :options

    def initialize(options = BackupRepos::Mash.new({}))
      @options = options
    end

    # === OPTIONS

    def debug
      options.debug || config['debug']
    end

    def backup_root
      return if backup_root_dir.blank?

      File.expand_path(backup_root_dir)
    end

    def github_access_token
      config_token = config['github']['access_token'] if config['github']
      options.github_access_token || config_token
    end

    def only_list
      return if options.only.blank?

      options.only.split(',').map(&:strip)
    end

    # ===

    def method_missing(name, *_args)
      return options.send(name) if options.respond_to?(name)

      config[name.to_s]
    end

    def respond_to_missing?(name, include_private = false)
      options.respond_to?(name) || config.key?(name.to_s) || super
    end

    def config_file
      return File.expand_path(ENV['CONFIG_PATH']) if ENV['CONFIG_PATH'].present?
      return File.expand_path(options.config_file) if options.config_file.present?

      File.join(Dir.home, '.backup-repos')
    end

    def dig(*args)
      config.dig(*args)
    end

    private

    def config
      @config ||= BackupRepos::Mash.new(file_config)
    end

    def file_config
      return {} unless File.exist?(config_file)

      @file_config ||= (YAML.load_file(config_file) || {})
    end

    def backup_root_dir
     return File.expand_path(ENV['BACKUP_DIR']) if ENV['BACKUP_DIR'].present?

      options.backup_root || config['backup_root']
    end
  end
end

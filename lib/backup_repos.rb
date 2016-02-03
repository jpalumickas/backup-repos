require 'octokit'

require 'backup_repos/config'
require 'backup_repos/shell'
require 'backup_repos/version'

module BackupRepos
  Octokit.auto_paginate = true

  def self.shell
    @shell ||= BackupRepos::Shell.new
  end

  def self.config
    @config ||= BackupRepos::Config.new
  end
end

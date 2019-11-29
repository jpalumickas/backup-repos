# frozen_string_literal: true

require 'gitlab'
require 'uri'

require_relative 'performers/gitlab_repository'

module BackupRepos
  class BackupGitlabEndpoint
    DEFAULT_ENDPOINT = 'https://gitlab.com/api/v4'

    attr_reader :endpoint, :private_token

    def initialize(settings)
      @endpoint = settings.endpoint || DEFAULT_ENDPOINT
      @private_token = settings.private_token
    end

    def call
      backup_repositories
    end

    def repos
      @repos ||= client.projects(membership: true).auto_paginate
    end

    def client
      @client ||= ::Gitlab.client(
        private_token: private_token,
        endpoint: endpoint
      )
    end

    def endpoint_host
      @endpoint_host ||= URI.parse(endpoint).host
    end

    private

    def backup_repositories
      repos.each do |repo_params|
        performer = Performers::GitlabRepository.new(
          repo_params, endpoint_host: endpoint_host
        )

        performer.backup
      end
    end
  end
end

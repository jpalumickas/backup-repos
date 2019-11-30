# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backup_repos/version'

Gem::Specification.new do |spec|
  spec.name          = 'backup_repos'
  spec.version       = BackupRepos::VERSION
  spec.authors       = ['Justas Palumickas']
  spec.email         = ['jpalumickas@gmail.com']

  spec.summary       = 'Backup your repositories'
  spec.description   = 'Backup your GitHub, BitBucket, GitLab repositories to '\
                       'specified directory.'
  spec.homepage      = 'https://github.com/jpalumickas/backup-repos'

  spec.files = Dir['*.{md,txt}', 'LICENSE', '{lib}/**/*', 'bin/backup-repos']

  spec.bindir        = 'bin'
  spec.executables   = ['backup-repos']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'bitbucket_rest_api', '~> 0.1.7'
  spec.add_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency 'commander', '~> 4.4'
  spec.add_dependency 'gitlab', '~> 4.12'
  spec.add_dependency 'hashie', '~> 4.0'
  spec.add_dependency 'highline', '~> 2.0'
  spec.add_dependency 'octokit', '~> 4.14'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backup_repos/version'

Gem::Specification.new do |spec|
  spec.name          = 'backup_repos'
  spec.version       = BackupRepos::VERSION
  spec.authors       = ['Justas Palumickas']
  spec.email         = ['jpalumickas@gmail.com']

  spec.summary       = 'Backup your repositories'
  spec.description   = 'Backup your GitHub, BitBucket repositories to '\
                       'specified directory.'
  spec.homepage      = 'https://github.com/jpalumickas/backup-repos'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['backup-repos']
  spec.require_paths = ['lib']

  spec.add_dependency 'commander', '~> 4.3'
  spec.add_dependency 'colorize', '~> 0.7.7'
  spec.add_dependency 'hashie', '~> 3.4'
  spec.add_dependency 'octokit', '~> 4.2'
  spec.add_dependency 'bitbucket_rest_api', '~> 0.1.7'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

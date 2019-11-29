# frozen_string_literal: true

require 'simplecov'
require 'codecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Codecov,
    SimpleCov::Formatter::HTMLFormatter
  ]
)
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'backup_repos'

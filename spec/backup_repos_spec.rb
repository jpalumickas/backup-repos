require 'spec_helper'

describe BackupRepos do
  it 'has a version number' do
    expect(BackupRepos::VERSION).not_to be nil
  end

  it 'has shell class' do
    expect(BackupRepos.shell).to be_a(BackupRepos::Shell)
  end

  it 'has config class' do
    expect(BackupRepos.config).to be_a(BackupRepos::Config)
  end

  it 'has able to set config options' do
    BackupRepos.config_options = { test: true }
    expect(BackupRepos.config.options).to eq(test: true)
  end
end

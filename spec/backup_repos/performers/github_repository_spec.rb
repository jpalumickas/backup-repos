# frozen_string_literal: true

require 'spec_helper'

describe BackupRepos::Performers::GithubRepository do
  let(:options) do
    double(
      full_name: 'test/my_repo',
      ssh_url: 'https://github.com/test/my_repo.git'
    )
  end

  subject { BackupRepos::Performers::GithubRepository.new(options) }

  it 'has correct provider name' do
    expect(subject.provider).to eq('GitHub')
  end

  it 'has correct clone url' do
    expect(subject.clone_url).to eq('https://github.com/test/my_repo.git')
  end

  it 'has correct backup path value' do
    expect(subject.backup_path).to eq('test/my_repo.git')
  end
end

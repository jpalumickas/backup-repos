require 'spec_helper'

describe BackupRepos::Performers::GitlabRepository do
  let(:repo_params) do
    double(
      path_with_namespace: 'test/my_repo',
      ssh_url_to_repo: 'git@gitlab.com:test/my_repo.git'
    )
  end

  let(:options) { { endpoint_host: 'gitlab.com' } }

  subject do
    BackupRepos::Performers::GitlabRepository.new(repo_params, options)
  end

  it 'has correct provider name' do
    expect(subject.provider).to eq('GitLab')
  end

  it 'has correct clone url' do
    expect(subject.clone_url).to eq('git@gitlab.com:test/my_repo.git')
  end

  it 'has correct backup path value' do
    expect(subject.backup_path).to eq('gitlab.com/test/my_repo.git')
  end
end

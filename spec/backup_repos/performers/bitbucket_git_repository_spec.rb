require 'spec_helper'

describe BackupRepos::Performers::BitbucketGitRepository do
  let(:options) { double(owner: 'test', slug: 'my_repo') }
  subject { BackupRepos::Performers::BitbucketGitRepository.new(options) }

  it 'has correct provider name' do
    expect(subject.provider).to eq('BitBucket')
  end

  it 'has correct clone url' do
    expect(subject.clone_url).to eq('git@bitbucket.org:test/my_repo.git')
  end

  it 'has correct backup path value' do
    expect(subject.backup_path).to eq('test/my_repo.git')
  end
end

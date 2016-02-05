require 'spec_helper'

describe BackupRepos::Performers::GithubWiki do
  let(:options) { double(full_name: 'test/my_repo') }
  subject { BackupRepos::Performers::GithubWiki.new(options) }

  it 'has correct provider name' do
    expect(subject.provider).to eq('GitHub')
  end

  it 'has correct clone url' do
    expect(subject.clone_url).to eq('git@github.com:test/my_repo.wiki.git')
  end

  it 'has correct backup path value' do
    expect(subject.backup_path).to eq('test/my_repo.wiki.git')
  end
end

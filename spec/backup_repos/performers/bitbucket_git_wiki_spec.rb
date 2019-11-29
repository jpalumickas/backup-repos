# frozen_string_literal: true

require 'spec_helper'

describe BackupRepos::Performers::BitbucketGitWiki do
  let(:options) { double(owner: 'test', slug: 'my_repo') }
  subject { BackupRepos::Performers::BitbucketGitWiki.new(options) }

  it 'has correct provider name' do
    expect(subject.provider).to eq('BitBucket')
  end

  it 'has correct clone url' do
    expect(subject.clone_url).to eq('git@bitbucket.org:test/my_repo.git/wiki')
  end

  it 'has correct backup path value' do
    expect(subject.backup_path).to eq('test/my_repo.wiki.git')
  end
end

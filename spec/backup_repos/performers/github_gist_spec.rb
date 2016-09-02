require 'spec_helper'

describe BackupRepos::Performers::GithubGist do
  let(:options) do
    double(
      id: 1234,
      git_pull_url: 'https://gist.github.com/test/1234',
      owner: double(login: 'test')
    )
  end

  subject { BackupRepos::Performers::GithubGist.new(options) }

  it 'has correct provider name' do
    expect(subject.provider).to eq('GitHub')
  end

  it 'has correct clone url' do
    expect(subject.clone_url).to eq('https://gist.github.com/test/1234')
  end

  describe '#backup_path' do
    context 'with owner' do
      it 'has correct backup path value' do
        expect(subject.backup_path).to eq('test/gists/1234.git')
      end
    end

    context 'without owner' do
      let(:options) do
        double(
          id: 1234,
          git_pull_url: 'https://gist.github.com/test/1234',
          owner: nil
        )
      end

      it 'has correct backup path value' do
        expect(subject.backup_path).to eq('anonymous/gists/1234.git')
      end
    end
  end
end

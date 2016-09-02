require 'spec_helper'

describe BackupRepos::Config do
  let(:options) do
    double(debug: true, backup_root: nil, test: true, github_access_token: nil)
  end

  subject { BackupRepos::Config.new(options) }

  describe '#debug' do
    it 'has to be true when option is debug' do
      expect(subject.debug).to be_truthy
    end
  end

  describe '#backup_root' do
    before do
      allow_any_instance_of(BackupRepos::Config).to receive(:file_config)
        .and_return(backup_root: 'backup_dir')
      allow(File).to receive(:expand_path).with('backup_dir')
        .and_return('absolute_backup_dir')
    end

    it 'has correct value from file config' do
      expect(subject.backup_root).to eq('absolute_backup_dir')
    end
  end

  describe '#github_access_token' do
    before do
      allow_any_instance_of(BackupRepos::Config).to receive(:file_config)
        .and_return(github: { access_token: 'token' })
    end

    context 'from config file' do
      it 'has correct value from config file' do
        expect(subject.github_access_token).to eq('token')
      end
    end

    context 'from options' do
      let(:options) { double(github_access_token: 'tokeny') }

      it 'has correct value from options' do
        expect(subject.github_access_token).to eq('tokeny')
      end
    end
  end

  describe '#method_missing' do
    it 'has correct value from config' do
      expect(subject.test).to eq(true)
    end
  end

  describe '#respond_to_missing?' do
    it 'has correct value from config' do
      expect(subject.respond_to?(:test)).to eq(true)
    end
  end

  describe '#config_file' do
    it 'has correct config file' do
      allow(Dir).to receive(:home).and_return('home_dir')

      expect(File).to receive(:join).with('home_dir', '.backup-repos')
        .and_return('test')

      BackupRepos::Config.new.debug
    end
  end

  describe '#file_config' do
    it 'has received default config when file not exist' do
      allow_any_instance_of(BackupRepos::Config).to receive(:config_file)
        .and_return('config_file')

      expect(File).to receive(:exist?).with('config_file')
        .and_return(false)

      BackupRepos::Config.new.debug
    end

    it 'has loaded yaml from file' do
      allow_any_instance_of(BackupRepos::Config).to receive(:config_file)
        .and_return('config_file')

      allow(File).to receive(:exist?).with('config_file')
        .and_return(true)

      expect(YAML).to receive(:load_file).with('config_file')
        .and_return({})

      BackupRepos::Config.new.debug
    end
  end
end

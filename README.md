# Backup Repos

[![Gem Version](https://img.shields.io/gem/v/backup_repos.svg?style=flat-square)][rubygems]
[![Coverage Status](https://img.shields.io/codecov/c/github/jpalumickas/backup-repos?style=flat-square)][codecov]


Backup your GitHub, BitBucket and GitLab repositories to specified directory.

## Installation

```shell
$ gem install backup_repos
```

## Usage

#### Setup your settings

```shell
$ backup-repos setup
```

Settings will be written to your home directory `.backup-repos` file.

#### Backup your repositories

Backup all your providers:

```shell
$ backup-repos backup
```

Or specify one provider:

```shell
$ backup-repos backup github
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpalumickas/backup-repos.

## Copyright
Copyright (c) 2019 Justas Palumickas.
See [LICENSE][] for details.

[rubygems]: https://rubygems.org/gems/backup_repos
[codecov]: https://codecov.io/gh/jpalumickas/backup-repos

[license]: LICENSE.md

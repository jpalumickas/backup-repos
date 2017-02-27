# Backup Repos

[![Gem Version](https://img.shields.io/gem/v/backup_repos.svg?style=flat-square)][rubygems]
[![Gitter](https://img.shields.io/gitter/room/jpalumickas/jpalumickas.svg?style=flat-square)][gitter]
[![Build Status](https://img.shields.io/travis/jpalumickas/backup-repos.svg?style=flat-square)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/jpalumickas/backup-repos.svg?style=flat-square)][gemnasium]
[![Coverage Status](https://img.shields.io/coveralls/jpalumickas/backup-repos.svg?branch=master&style=flat-square)][coveralls]
[![Code Climate](https://img.shields.io/codeclimate/github/jpalumickas/backup-repos.svg?style=flat-square)][codeclimate]


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

Or specify one:

```shell
$ backup-repos backup github
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpalumickas/backup-repos.

## Copyright
Copyright (c) 2017 Justas Palumickas.
See [LICENSE][] for details.

[rubygems]: https://rubygems.org/gems/backup_repos
[travis]: http://travis-ci.org/jpalumickas/backup-repos
[gemnasium]: https://gemnasium.com/jpalumickas/backup-repos
[coveralls]: https://coveralls.io/r/jpalumickas/backup-repos
[codeclimate]: https://codeclimate.com/github/jpalumickas/backup-repos
[gitter]: https://gitter.im/jpalumickas/backup-repos

[license]: LICENSE.md

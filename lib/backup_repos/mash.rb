# frozen_string_literal: true

require 'hashie/mash'

module BackupRepos
  class Mash < Hashie::Mash
    disable_warnings
  end
end

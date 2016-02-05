require 'spec_helper'

describe String do
  describe '#blank?' do
    it 'has true value when string is empty' do
      expect('     ').to be_blank
    end

    it 'has false value when string is not empty' do
      expect('    r').to_not be_blank
    end
  end
end

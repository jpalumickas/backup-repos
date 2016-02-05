require 'spec_helper'

describe Object do
  describe '#blank?' do
    it 'has true value on nil' do
      expect(nil).to be_blank
    end

    it 'has true value on empty array' do
      expect([]).to be_blank
    end

    it 'has false value on array with values' do
      expect([1, 2, 3]).to_not be_blank
    end
  end
end

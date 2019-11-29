# frozen_string_literal: true

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

  describe '#present?' do
    it 'has false value on nil' do
      expect(nil).to_not be_present
    end

    it 'has false value on empty array' do
      expect([]).to_not be_present
    end

    it 'has true value on array with values' do
      expect([1, 2, 3]).to be_present
    end
  end
end

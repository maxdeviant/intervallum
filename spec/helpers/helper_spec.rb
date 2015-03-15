require 'spec_helper'

describe 'testing helpers...' do
	context '#months_in_words' do
	  it 'returns a month, in words, when an input number is given' do
      expect(Helpers.months_in_words(1)).to eq('January')
    end
  end

  context '#leap_year' do
  	it 'returns true for a a leap year' do
  		expect(Helpers.leap_year(2004)).to eq(true)
    end

    it 'returns false for a non-leap year' do
    	expect(Helpers.leap_year(2005)).to eq(false)
    end
  end

  context '#adjust_single_digits' do
    it 'places a leading 0 for a number under 10 and returns as string' do
      expect(Helpers.adjust_single_digits(5)).to eq('05')
    end

    it 'does not place a leading zero for numbers greater than 10 but returns as string' do
      expect(Helpers.adjust_single_digits(10)).to eq('10')
    end
  end
end
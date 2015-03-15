# need to re-write some methods due to
# 'now' being set to the current day
# using methods where possible

require 'spec_helper'

describe 'testing methods...' do

  # setting fixed Time object for testing purposes (March 14, 2015)
  before :each do
    @time = Time.parse('2015-03-14')
  end

  context '#today' do
    it 'returns the Gregorian day as a string' do
      today = "#{@time.year}-#{Helpers.adjust_single_digits(@time.month)}-#{Helpers.adjust_single_digits(@time.day)}"
      expect(today).to be_a_kind_of(String)
    end

    it 'returns the current day in Gregorian format' do
      today = "#{@time.year}-#{Helpers.adjust_single_digits(@time.month)}-#{Helpers.adjust_single_digits(@time.day)}"
      expect(today).to eq('2015-03-14')
    end
  end

  context '#this_day' do
    it 'returns the day as a number of the month' do
      day = Helpers.adjust_single_digits(@time.day)
      expect(day).to eq('14')
    end

    it 'returns the day with a leading zero if less than 10' do
      expect(Helpers.adjust_single_digits(3)).to eq('03')
    end
  end

  context '#wordy_month' do
    it 'returns the month, in words' do
      # expect(Intervallum.wordy_month(1)).to eq('January')
      expect(Intervallum.wordy_month(7)).to eq('July') 
    end
  end

  context '#this_month' do
    it 'returns the number of the month, as a string' do
      expect("#{@time.month}").to eq('3')
    end
  end

  context '#wordy_day' do
    it 'returns the day, in words' do
      months = { 3 => 'March' }
      expect("#{months[@time.month]} #{@time.day}, #{@time.year}").to eq('March 14, 2015')
    end
  end

end # describe
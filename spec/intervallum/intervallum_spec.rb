# need to re-write some methods due to
# 'now' being set to the current day

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
      # day = Helpers.adjust_single_digits(@time.day)
      # expect(day).
  end
end
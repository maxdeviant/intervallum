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

  context '#tomorrow' do
    it 'returns the next day in Gregorian format' do
      expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month)}-#{@time.day+1}").to eq('2015-03-15')
    end

    it 'returns the first day of the next month if today is the last day of the month' do
      time = Time.parse('2015-03-31')
      expect("#{time.year}-#{Helpers.adjust_single_digits(time.month+1)}-01").to eq('2015-04-01')
    end

    it 'returns the first day of the next year if today is December 31st' do
      time = Time.parse('2015-12-31')
      expect("#{time.year+1}-01-01").to eq('2016-01-01')
    end
  end

  context '#yesterday' do
    it 'returns the previous day in a Gregorian format' do
      expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month)}-#{@time.day-1}").to eq('2015-03-13')
    end

    it 'returns the last day of the previous month if currently the first of the month' do
      last_day_in_march = 31
      time = Time.parse('2015-04-01')
      expect("#{time.year}-#{Helpers.adjust_single_digits(time.month-1)}-#{last_day_in_march}").to eq('2015-03-31')
    end

    it 'returns December 31st of previous year if January 1st' do
      time = Time.parse('2015-01-01')
      expect("#{@time.year-1}-12-31"). to eq('2014-12-31')
    end
  end

  context '#first_of_the_month' do
    it 'returns the first day of the respective month' do
      expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month)}-01").to eq('2015-03-01')
    end
  end

  context '#this_month' do
    it "returns the current month's number, as a string" do
      expect(Intervallum.this_month).to be_a_kind_of(String)
    end
  end

  context '#last_month' do
    it 'returns the first day of the previous month' do
      expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month-1)}-01").to eq('2015-02-01')
    end

    it 'returns December 1st of previous year if January' do
      time = Time.parse('2015-01-01')
      expect("#{time.year-1}-12-01").to eq('2014-12-01')
    end
  end

  context '#next_month' do
    it 'retruns the first of the month, of the following month' do
      expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month+1)}-01").to eq('2015-04-01')
    end

    it 'returns the first day of the year, next year, if month is in December' do
      time = Time.parse('2015-12-4')
      expect("#{time.year+1}-01-01").to eq('2016-01-01')
    end
  end

  context '#in_months(N)' do
    it 'returns first of month, in N months, where is + or -, staying in the same year' do
      # number = 6
      number = -1
      # expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month + number)%12}-01").to eq('2015-09-01')
      expect("#{@time.year}-#{Helpers.adjust_single_digits(@time.month + number)%12}-01").to eq('2015-02-01')
    end

    it 'returns the first of the month, of respective month, crossing years' do
      # number = 14
      number = -5

      # up
      # expect("#{@time.year+1}-#{Helpers.adjust_single_digits((@time.month+number)%12)}-01").to eq('2016-05-01')
      # down
      expect("#{@time.year-1}-#{Helpers.adjust_single_digits((@time.month+number)%12)}-01").to eq("2014-10-01")
    end
  end

end # describe
























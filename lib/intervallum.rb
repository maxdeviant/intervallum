require 'intervallum/helpers'

=begin

List of methods and examples as if today was March 2 2015

- today                        # "2015-03-02"
- this_day                     # "02"
- wordy_day                    # "March 2, 2015"
- tomorrow                     # "2015-03-03"  , alias: next_day
- yesterday                    # "2015-03-01"  , alias: previous_day
- this_month                   # "3"
- first_of_the_month           # "2015-03-01"
- last_month                   # "2015-02-01"  , alias: previous_month
- next_month                   # "2015-04-01"
- wordy_month(3)             # "March"         , note:  argument can be string or integer
- last_year                    # "2014"        , alias: previous_year
- this_year                    # "2015"
- next_year                    # "2016"
- in_months(4)                 # "2015-07-01"    , note: if argument is letter (e.g. 'J'), argument turns to 0
- in_months(-2)                # "2015-01-01"    , note: if argument is letter (e.g. 'J'), argument turns to 0

=end

class Intervallum
	class << self
		attr_reader :now
		@@now = Time.now
		def today
			"#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day)}"
		end # today

		def this_day
			Helpers.adjust_single_digits(@@now.day)
		end # this_day

		def wordy_day
			"#{Intervallum.wordy_month(Intervallum.this_month)} #{@@now.day}, #{@@now.year}"
		end # wordy_day

		def tomorrow
			days_in_month = Helpers.number_of_days_in_month(Helpers.months_in_words(@@now.month), @@now.year)
			# if last day of the month, return the first of the next month
			if @@now.day + 1 > days_in_month
				return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month+1)}-01"
			# if December 31st, head over to next year
			elsif @@now.month == 12 && @@now.day + 1 > days_in_month
				return "#{@@now.year+1}-01-01"
			# return the next day
			else
				return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day+1)}"
			end
		end # tomorrow

		def next_day
			Intervallum.tomorrow
		end # next_day

		# returns previous day's date
		def yesterday
			last_day_of_previous_month = Helpers.number_of_days_in_month(Helpers.months_in_words(@@now.month-1), @@now.year)
			# if 1st day of the month, return last day of previous
			if @@now.day - 1 <= 0
				return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month-1)}-#{last_day_of_previous_month}"
			# if 1st day of the year, return December 31st of last year
			elsif @@now.day - 1 <= 0 && @@now.month == 1
				return "#{@@now.year-1}-12-31"
			# just return the day before otherwise
			else
				return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day-1)}"
			end
		end # yesterday

		def previous_day
			Intervallum.yesterday
		end # previous_day

		def first_of_the_month
			"#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-01"
		end # first_of_the_month

		def this_month
			"#{@@now.month}"
		end # this_month

		def wordy_month(month_as_string_or_integer)
			Helpers.months_in_words(month_as_string_or_integer.to_i)
		end # wordy_month

		def last_month
			@@now.month <= 1 ? "#{@@now.year-1}-12-01" : "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month-1)}-01"
		end # last_month

		def previous_month
			Intervallum.last_month
		end # previous_month

		def next_month
			@@now.month >= 12 ? "#{@@now.year+1}-01-01" : "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month+1)}-01"
		end # next_month

		def last_year
			"#{@@now.year-1}"
		end # last_year

		def previous_year
			Intervallum.last_year
		end # previous_year

		def this_year
			"#{@@now.year}"
		end # this_year

		def next_year
			"#{@@now.year+1}"
		end # next_year

		# returns the first day of the month, after a +/- month is specified
		def in_months(number)
			number = number.to_i

			# if number is 0, return current month
			if number == 0
				Intervallum.first_of_the_month
			# go into next year
			elsif @@now.month + number > 12
				"#{@@now.year+1}-#{Helpers.adjust_single_digits((@@now.month+number)%12)}-01"
			# go into last year
			elsif @@now.month + number < 1 && (@@now.month+number) % 12 != 0
				"#{@@now.year-1}-#{Helpers.adjust_single_digits((@@now.month+number)%12)}-01"
			# if land on December of this year
			elsif (@@now.month + number) % 12 == 0 && number > 0
				"#{@@now.year}-12-01"
			# if land on December of last year
			elsif (@@now.month + number) % 12 == 0 && number < 0
				"#{@@now.year-1}-12-01"
			# we stayed in the same year
			else
				"#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month+number)}-01"
			end # in_months
		end # self
	end
end
=begin

List of methods and examples as if today was March 2 2015

today                        # "2015-03-02"
this_day                     # "02"
wordy_day                    # "March 2, 2015"
tomorrow                     # "2015-03-03", alias: next_day
yesterday                    # "2015-03-01", alias: previous_day
this_month                   # "3"
first_of_the_month           # "2015-03-01"
last_month                   # "2015-02-01", alias: previous_month
next_month                   # "2015-04-01"
wordy_month(arg)             # "March"     , note: 'arg' can be string or integer
last_year                    # "2014"      , alias: previous_year
this_year                    # "2015"
next_year                    # "2016"
in_months(4)                 # "2015-07-01"
in_months(-2)                # "2015-01-01"

=end

class Intervallum
	attr_reader :now
	@@now = Time.now

	def self.today
		"#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day)}"
	end

	def self.this_day
		Helpers.adjust_single_digits(@@now.day)
	end

	def self.wordy_day
		"#{Intervallum.wordy_month(Intervallum.this_month)} #{@@now.day}, #{@@now.year}"
	end

	def self.tomorrow
		days_in_month = Helpers.number_of_days_in_month(Helpers.months_in_words(@@now.month), @@now.year)
		# if last day of the month, return the first of the next month
		if @@now.day + 1 > days_in_month
			return "#{@@now.year}-#{@@now.month+1}-01"
		# if December 31st, head over to next year
		elsif @@now.month == 12 && @@now.day + 1 > days_in_month
			return "#{@@now.year+1}-01-01"
		# return the next day
		else
			return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day+1)}"
		end
	end

	def self.next_day
		Intervallum.tomorrow
	end

	# returns previous day's date
	def self.yesterday
		last_day_of_previous_month = Helpers.number_of_days_in_month(Helpers.months_in_words(@@now.month-1), @@now.year)
		# if 1st day of the month, return last day of previous
		if @@now.day - 1 <= 0
			return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month-1)}-#{last_day_of_previous_month}"
		# if 1st day of the year, return December 31st of last year
		elsif @@now.day - 1 <= 0 && @@now.month == 1
			return "#{@@now.year-1}-31-01"
		# just return the day before otherwise
		else
			return "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day-1)}"
		end
	end

	def self.previous_day
		Intervallum.yesterday
	end

	def self.first_of_the_month
		"#{@@now.year}-#{Helpers.adjust_single_digits(@now.month)}-01"
	end

	def self.this_month
		"#{@@now.month}"
	end

	def self.wordy_month(month_as_string_or_integer)
		Helpers.months_in_words(month_as_string_or_integer.to_i)
	end

	def self.last_month
		@@now.month <= 1 ? "#{@@now.year-1}-12-01" : "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month-1)}-01"
	end

	def self.previous_month
		Intervallum.last_month
	end

	def self.next_month
		@@now.month >= 12 ? "#{@@now.year+1}-01-01" : "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month+1)}-01"
	end

	def self.last_year
		"#{@@now.year-1}"
	end

	def self.previous_year
		Intervallum.last_year
	end

	def self.this_year
		"#{@@now.year}"
	end

	def self.next_year
		"#{@@now.year+1}"
	end

	# returns the first day of the month, after a +/- month is specified
	def self.in_months(number)
		# go into next year
		if @@now.month + number > 12
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
		end
	end
end

private

class Helpers
	# takes a number and returns its month
	def self.months_in_words(month_number)
		months = {
			1 => "January",
			2 => "February",
			3 => "March",
			4 => "April",
			5 => "May",
			6 => "June",
			7 => "July",
			8 => "August",
			9 => "September",
			10 => "October",
			11 => "November",
			12 => "December"
		}
		months[month_number]
	end

	# gives the number of days in each month
	def self.number_of_days_in_month(month_name, year)
		months = {
			"January" => 31,
			"February" => 28,
			"March" => 31,
			"April" => 30,
			"May" => 31,
			"June" => 30,
			"July" => 31,
			"August" => 31,
			"September" => 30,
			"October" => 31,
			"November" => 30,
			"December" => 31
		}
		leap_year(year) && month_name == "February" ? 29 : months[month_name]
	end

	# returns true if leap year
	def self.leap_year(year)
		if year % 4 != 0
			false
		elsif year % 400 == 0
			true
		elsif year % 100 == 0
			false
		else
			true
		end
	end

	# takes a single digit numbers puts a 0 in front
	def self.adjust_single_digits(number)
		number < 10 ? "0#{number}" : "#{number}"
	end
end
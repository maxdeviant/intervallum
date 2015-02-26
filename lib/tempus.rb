class Tempus
	attr_reader :now
	@@now = Time.now

	# e.g. "yyyy-mm-dd" for current day
	def self.today
		"#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month)}-#{Helpers.adjust_single_digits(@@now.day)}"
	end

	def self.this_day
		Helpers.adjust_single_digits(@@now.day)
	end

	def self.tomorrow
		# TODO
	end

	def self.next_day
		Tempus.tomorrow
	end

	def self.yesterday
		# TODO
	end

	def self.previous_day
		Tempus.yesterday
	end

	def self.this_month
		"#{@@now.month}"
	end

	def self.this_month_word
		Helpers.months_in_words(@@now.month)
	end

	def self.last_month
		@@now.month <= 1 ? "#{@@now.year-1}-12-01" : "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month-1)}-01"
	end

	def self.last_month_word
		@@now.month <= 1 ? Helpers.months_in_words(12) : Helpers.months_in_words(@@now.month-1)
	end

	def self.next_month
		@@now.month >= 12 ? "#{@@now.year+1}-01-01" : "#{@@now.year}-#{Helpers.adjust_single_digits(@@now.month+1)}-01"
	end

	def self.last_year
		"#{@@now.year-1}"
	end

	def self.this_year
		"#{@@now.year}"
	end

	def self.next_year
		"#{@@now.year+1}"
	end
end

class Helpers
	# takes a number and returns its month
	# returns nil if not included
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

		if leap_year(year)
			months["February"] = 29
		end
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
		if number < 10
			return "0#{number}"
		else
			return "#{number}"
		end
	end
end
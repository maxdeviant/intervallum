class Tempus
	# global for today
	NOW = Time.now

	# e.g. "yyyy-mm-dd" for current day
	def self.today
		day   = Helpers.adjust_single_digits(NOW.day)
		month = Helpers.adjust_single_digits(NOW.month)
		year  = Helpers.adjust_single_digits(NOW.year)
		return "#{year}-#{month}-#{day}"
	end

	# alias .today
	def self.this_day
		Tempus.today
	end

	def self.this_month
		"#{NOW.month}"
	end

	def self.this_month_word
		Helpers.months_in_words(NOW.month)
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

	# takes a single digit numbers puts a 0 in front
	def self.adjust_single_digits(number)
		if number < 10
			return "0#{number}"
		else
			return "#{number}"
		end
	end
end
# these are helpers for the Intervallum class
class Helpers

	# takes a number and returns its month
	def self.months_in_words(month_number)
		raise 'An invalid argument was passed' if month_number > 12 || month_number < 1
		months = {
			1 => 'January',
			2 => 'February',
			3 => 'March',
			4 => 'April',
			5 => 'May',
			6 => 'June',
			7 => 'July',
			8 => 'August',
			9 => 'September',
			10 => 'October',
			11 => 'November',
			12 => 'December'
		}
		months[month_number]
	end

	# gives the number of days in each month
	def self.number_of_days_in_month(month_name, year)
		months = {
			'January' => 31,
			'February' => 28,
			'March' => 31,
			'April' => 30,
			'May' => 31,
			'June' => 30,
			'July' => 31,
			'August' => 31,
			'September' => 30,
			'October' => 31,
			'November' => 30,
			'December' => 31
		}
		raise 'An invalid argument was passed' if !months.keys.include?(month_name)
		leap_year(year) && month_name == 'February' ? 29 : months[month_name]
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
		raise 'An invalid argument was passed' if !number.is_a? Integer
		number < 10 ? "0#{number}" : "#{number}"
	end

	# if input is not equal to the gregorian format
	# if the input is a letter turned to an integer, it'll be zero
  # otherwise... return true
  def self.gregorian_format?(input)
    if input[5..6].to_i < 1 || input[5..6].to_i > 13
      false
    elsif input.length != 10
      false
    else
      true
    end
  end
	
end


















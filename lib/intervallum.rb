# require all files
Dir.glob(File.join('**', '*.rb')).each { |file| require "./#{file}" }

# libraries / gems
require 'time'
require 'date'
require 'awesome_print'

# for each method, if 'd' is passed in, return Date
# for each method, if 't' is passed in, return Time
# for each method, if 's' or nothing is passedm return String
class Intervallum
  class << self

    # helper methods

    def self.lead_zero(number)
      number < 10 ? "0#{number}" : "#{number}"
    end

    def string_to_date(string_date)
      Date.parse(string_date)
    end

    def string_to_time(string_date)
      Time.parse(string_date)
    end

    def string_to_julian_date(string_date)
      Date.parse(string_date).julian
    end

    def string_to_julian_time(string_date)
      Time.parse(Date.parse(string_date))
    end

    def string_to_julian_string(string_date)
      Date.parse(string_date).julian.to_s
    end

    # methods

    def now(type=nil, julian=nil)
      ap type
      ap julian
      # To return Julian time as a String: Time.parse(Intervallum('t','julian'))
      if type == 'd' && !julian
        self.string_to_date(@gregorian_string)
      elsif type == 't' && !julian
        self.string_to_time(@gregorian_string)
      elsif type == 's' && !julian
        @@gregorian_string
      elsif type == 'd' && julian == 'julian'
        self.string_to_julian_date(@@gregorian_string)
      elsif type == 't' && julian == 'julian'
        self.string_to_julian_time(@@gregorian_string)
      elsif type == 's' && julian == 'julian'
        self.string_to_julian_string(@@gregorian_string)
      else
        @@gregorian_string
      end
    end

    def today(option=nil)
    end

    def previous_month(type=nil, julian=nil)
      self.last_month(type, julian)
    end

    def last_month(type=nil, julian=nil)
      ap 'hello world'
    end

    @@now    = Time.now
    @@year   = @@now.year
    @@month  = self.lead_zero(@@now.month)
    @@day    = self.lead_zero(@@now.day)
    @@gregorian_string = "#{@@year}-#{@@month}-#{@@day}"

  end # self
end # class

























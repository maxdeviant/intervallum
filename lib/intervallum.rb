# require all files
# require './intervallum/module.scroll.rb'
# require './intervallum/module.spell.rb'
p Dir['./lib/intervallum/*'].each { |file| require file }

# libraries / gems
require 'time'
require 'date'
require 'awesome_print'

# main class
class Intervallum
  class << self

    def borges
      ap "Time is the substance I am made of."
      ap "Time is a river which sweeps me along, but I am the river;"
      ap "it is a tiger which destroys me, but I am the tiger;"
      ap "it is a fire which consumes me, but I am the fire."
      ap "- Jorge Luis Borges"
    end

    def today(option=nil)
      option.downcase! if option
      if option == 'd' || option == 'date'
        Spell.to_date(@@string)
      elsif option == 'j' || option == 'julian'
        Spell.to_julian(@@string)
      elsif option == 't' || option == 'time'
        Spell.to_time(@@string)
      elsif option == 'e' || option == 'epoch'
        Spell.to_epoch(@@string)
      else
        Spell.to_string(@@string)
      end
    end

    def this_day(as_integer=nil)
      as_integer.downcase! if as_integer
      if as_integer == 'i' || as_integer == 'integer' || as_integer == 'int'
        @@string[-2..-1].to_i
      else
        @@string[-2..-1]
      end
    end

    def wordy_day
      self.scribed_day
    end

    def scribed_day
      "#{Scroll.get_month_name(@@month.to_i)} #{@@day.to_i}, #{@@year}"
    end

    def previous_day(option=nil)
      self.yesterday(option)
    end

    def yesterday(option=nil)
      if Scroll.first_of_the_year?(@@month, @@day)
        string = "#{@@year-1}-12-01"
      elsif Scroll.first_of_the_month?(@@month, @@day)
        previous_month = @@month.to_i-1
        string = "#{@@year}-#{previous_month}-#{Scroll.last_day_of_month(previous_month)}"
      else
        string = "#{@@year}-#{@@month}-#{Spell.leading_zero(@@day.to_i-1)}"
      end

      option.downcase! if option
      if option == 'd' || option == 'date'
        Spell.to_date(string)
      elsif option == 'j' || option == 'julian'
        Spell.to_julian(string)
      elsif option == 't' || option == 'time'
        Spell.to_time(string)
      elsif option == 'e' || option == 'epoch'
        Spell.to_epoch(string)
      else
        Spell.to_string(string)
      end
    end

    def next_day(option=nil)
      self.tomorrow(option)
    end

    def tomorrow(option=nil)
      if Scroll.last_day_of_the_year?(@@month, @@day)
        answer = "#{@@year+1}-01-01"
      elsif Scroll.last_day_of_month?(@@month.to_i, @@day)
        answer = "#{@@year}-#{Spell.leading_zero(@@month.to_i+1)}-01"
      else
        answer = "#{@@year}-#{@@month}-#{Spell.leading_zero(@@day.to_i+1)}"
      end

      option.downcase! if option
      if option == 'd' || option == 'date'
        Spell.to_date(answer)
      elsif option == 'j' || option == 'julian'
        Spell.to_julian(answer)
      elsif option == 't' || option == 'time'
        Spell.to_time(answer)
      elsif option == 'e' || option == 'epoch'
        Spell.to_epoch(answer)
      else
        Spell.to_string(answer)
      end
    end

    def first_of_the_month(option=nil)
      string = "#{@@year}-#{@@month}-01"
      option.downcase! if option
      if option == 'd' || option == 'date'
        Spell.to_date(string)
      elsif option == 'j' || option == 'julian'
        Spell.to_julian(string)
      elsif option == 't' || option == 'time'
        Spell.to_time(string)
      elsif option == 'e' || option == 'epoch'
        Spell.to_epoch(string)
      else
        Spell.to_string(string)
      end
    end

    def previous_month(option=nil)
      self.last_month(option)
    end

    def last_month(option=nil)
      month = @@month.to_i-1
      if Scroll.first_month_of_the_year?(month)
        string = "#{@@year-1}-12-01"
      else
        string = "#{@@year}-#{Spell.leading_zero(month)}-01"
      end

      option.downcase! if option
      if option == 'd' || option == 'date'
        Spell.to_date(string)
      elsif option == 'j' || option == 'julian'
        Spell.to_julian(string)
      elsif option == 't' || option == 'time'
        Spell.to_time(string)
      elsif option == 'e' || option == 'epoch'
        Spell.to_epoch(string)
      else
        Spell.to_string(string)
      end
    end

    def current_month(as_integer=nil)
      self.this_month(as_integer)
    end

    def this_month(as_integer=nil)
      as_integer.downcase! if as_integer
      if as_integer == 'i' || as_integer == 'integer' || as_integer == 'int'
        @@month.to_i
      else
        @@month
      end
    end

    def next_month(option=nil)
      if Scroll.last_month_of_year?(@@month.to_i)
        string = "#{@@year+1}-01-01"
      else
        string = "#{@@year}-#{Spell.leading_zero(@@month.to_i+1)}-01"
      end

      option.downcase! if option
      if option == 'd' || option == 'date'
        Spell.to_date(string)
      elsif option == 'j' || option == 'julian'
        Spell.to_julian(string)
      elsif option == 't' || option == 'time'
        Spell.to_time(string)
      elsif option == 'e' || option == 'epoch'
        Spell.to_epoch(string)
      else
        Spell.to_string(string)
      end
    end

    def previous_year
      self.last_year
    end

    def last_year
      (@@year-1).to_s
    end

    def following_year
      self.next_year
    end

    def next_year
      (@@year+1).to_s
    end

    def current_year
      self.this_year
    end

    def this_year
      @@year.to_s
    end

    # "safe" only +/- 12 months
    def in_months(num=nil)
      num = num.to_i
      month = @@month.to_i

      if num == 0
        Intervallum.first_of_the_month
      elsif (month + num) > 12
        "#{@@year+1}-#{Spell.leading_zero((month+num)%12)}-01"
      elsif (month + num) < 1 && (month+num) % 12 != 0
        "#{@@year-1}-#{Spell.leading_zero((@@month.to_i+num)%12)}-01"
      elsif (month + num) % 12 == 0 && num > 0
        "#{@@year}-12-01"
      elsif (@@month.to_i + num) % 12 == 0 && num < 0
        "#{@@year-1}-12-01"
      else
        "#{@@year}-#{Spell.leading_zero(month + num)}-01"
      end
    end

    def wordy_month(month_number=nil)
      self.month_name(month_number)
    end

    def month_name(month_number=nil)
      if month_number 
        Scroll.get_month_name(month_number.to_i)
      else
        Scroll.get_month_name(@@month.to_i)
      end
    end

    # variables
    @@now    = Time.now
    @@year   = @@now.year
    @@month  = Spell.leading_zero(@@now.month)
    @@day    = Spell.leading_zero(@@now.day)
    @@string = "#{@@year}-#{@@month}-#{@@day}"

  end # self
end # class
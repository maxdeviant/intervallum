# “Time is the substance I am made of.
# Time is a river which sweeps me along, but I am the river;
# it is a tiger which destroys me, but I am the tiger; 
# it is a fire which consumes me, but I am the fire.”
# - Jorge Luis Borges

# require all files
Dir.glob(File.join('**', '*.rb')).each { |file| require "./#{file}" }

# libraries / gems
require 'time'
require 'date'
require 'awesome_print'

# main class
class Intervallum
  class << self

    def today(option=nil)
      option.downcase! if option
      if    option == 'd' || option == 'date'
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

    def this_day(as_integer=false)
      as_integer ? @@string[5..6].to_i : @@string[5..6]
    end

    def wordy_day
      self.scribed
    end

    def scribed
      "#{Scroll.get_month_name(@@month.to_i)} #{@@day.to_i}, #{@@year}"
    end

    def previous_day
      self.yesterday
    end

    def yesterday
      if Scroll.first_of_the_year?(@@month, @@day)
        "#{@@year-1}-12-01"
      elsif Scroll.first_of_the_month?(@@month, @@day)
        previous_month = @@month.to_i-1
        "#{@@year}-#{previous_month}-#{Scroll.last_day_of_month(previous_month)}"
      else
        "#{@@year}-#{@@month}-#{Scroll.leading_zero(@@day.to_i-1)}"
      end
    end

    def next_day
      self.tommorow
    end

    def tomorrow
      if Scroll.last_of_the_year?(@@month, @@day)
        "#{@@year+1}-01-01"
      elsif Scroll.last_of_the_month?(@@month, @@day)
        "#{@@year}-#{Scroll.leading_zero(@@month.to_i+1)}-01"
      else
        "#{@@year}-#{@@month}-#{Scroll.leading_zero(@@day.to_i+1)}"
      end
    end

    def first_of_the_month
      "#{@@year}-#{@@yesterday}-01"
    end

    def previous_month
      self.last_month
    end

    def last_month
      month = @@month.to_i-1
      "#{@@year}-#{Scroll.leading_zero(month)}-#{@@day}"
    end

    # WIP
    def this_month
      @@month
    end

    # WIP
    def next_month
      
    end

    # variables
    @@now    = Time.now
    @@year   = @@now.year
    @@month  = Scroll.leading_zero(@@now.month)
    @@day    = Scroll.leading_zero(@@now.day)
    @@string = "#{@@year}-#{@@month}-#{@@day}"

  end # self
end # class
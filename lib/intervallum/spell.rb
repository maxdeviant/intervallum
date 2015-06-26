class Spell
  def self.leading_zero(number)
    number < 10 ? "0#{number}" : "#{number}"
  end

  def self.to_date(input)
    if input.is_a?(String)
      Date.parse(input)
    elsif input.is_a?(Time)
      input.to_date
    elsif input.is_a?(Integer)
      self.to_date(Time.at(input))
    else
      input
    end
  end

  def self.to_time(input)
    if input.is_a?(String)
      Time.parse(input)
    elsif input.is_a?(Date)
      Time.parse(input.to_s)
    elsif input.is_a?(Integer)
      Time.at(input)
    else
      input
    end
  end

  def self.to_julian(input)
    if input.is_a?(String)
      Date.parse(input).julian.to_s
    elsif input.is_a?(Date)
      input.julian
    elsif input.is_a?(Integer)
      self.to_date(input).julian
    else
      input
    end
  end

  def self.to_epoch(input)
    if input.is_a?(String)
      Time.parse(input).to_i
    elsif input.is_a?(Date)
      self.to_time(input).to_i
    elsif input.is_a?(Time)
      input.to_i
    else
      input
    end
  end

  # returns an Integer in an iso801 format, sans hypens
  # e.g. 20150504 for May 4, 2015
  def self.to_iso8601_mod(input)
    if input.is_a?(String)
      input.gsub('-','').to_i
    elsif input.is_a?(Date)
      self.to_iso8601_mod(self.to_string(input))
    elsif input.is_a?(Time)
      self.to_iso8601_mod(self.to_string(input))
    elsif input.is_a?(Integer)
      self.to_iso8601_mod(self.to_string(input))
    end
  end

  def self.to_iso8601(input)
    self.to_string(input)
  end

  def self.to_string(input)
    if input.is_a?(Time)
      input.to_s[0..9]
    elsif input.is_a?(Date)
      input.to_s
    elsif input.is_a?(Integer)
      self.to_string(self.to_time(input))
    else
      input
    end
  end
end
module Scroll
  @month_numbers_to_names = {
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

  @month_names_to_numbers = @month_numbers_to_names.invert

  @days_in_month = {
    1 => 31,
    2 => 28,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }

  def self.get_month_name(number)
    @month_numbers_to_names[number]
  end

  def self.get_month_number(name)
    @month_names_to_numbers[name.capitalize]
  end

  def self.last_day_of_month?(month, day)
    if month.is_a? Integer
      day.to_i == @days_in_month[month]
    else
      day.to_i == @days_in_month[self.get_month_number(month)]
    end
  end

  def self.first_of_the_year?(month, day)
    if month.is_a? Integer
      month == 1 && day.to_i == 1
    else
      self.get_month_number(month) == 1 && day.to_i == 1
    end
  end

  def self.first_of_the_month?(month, day)
    day.to_i == 1
  end

  def self.last_day_of_the_year?(month, day)
    if month.is_a? Integer
      month == 12 && day.to_i == 31
    else
      self.get_month_number(month) == 12 && day.to_i == 31
    end
  end

  def self.last_month_of_year?(month)
    if month.is_a? Integer
      month == 12
    else
      self.get_month_number(month) == 12
    end
  end

  def self.last_of_the_month?(month, day)
    self.last_day_of_month?(month, day)
  end

  def self.first_month_of_the_year?(month)
    if month.is_a? Integer
      month == 1
    else
      self.get_month_number(month) == 1
    end
  end
end

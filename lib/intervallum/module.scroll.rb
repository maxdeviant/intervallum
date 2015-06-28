module Scroll
  def self.get_month_name(number)
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
    months[number]
  end

  def self.get_month_number(name)
    name.downcase!
    months = {
      'january' => 1,
      'february' => 2,
      'march' => 3,
      'april' => 4,
      'may' => 5,
      'june' => 6,
      'july' => 7,
      'august' => 8,
      'september' => 9,
      'october' => 10,
      'november' => 11,
      'december' => 12
    }
    months[name]
  end

  def self.last_day_of_month?(month_number, day)
    months = {
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
    day.to_i == months[month_number]
  end

  def self.first_of_the_year?(month, day)
    self.get_month_name(month.to_i) == 'January' && day.to_i == 1
  end

  def self.first_of_the_month?(month, day)
    day.to_i == 1
  end

  def self.last_day_of_the_year?(month, day)
    day = day.to_i
    month == 12 && day == 31
  end

  def self.last_month_of_year?(month)
    month == 12
  end

  def self.last_of_the_month?(month, day)
    self.last_day_of_month[month.to_i] == day
  end

  def self.first_month_of_the_year?(month)
    month == 1
  end
end
# intervallum
a manipulation of Ruby's `Time.now`


**<a href="installs">Install</a>**<br>
**<a href="intervallum">Intervallum</a>**<br>
**<a href="spell">Casting via Spells</a>**


### <a name="installs">Install</a>

```
gem install intervallum / gem 'intervallum'
```

To test it locally, try it out in `irb`

```
$ irb
irb(main):001:0> require 'intervallum'
=> true
irb(main):002:0> Intervallum.today
```

and you should see today's date as a String, in the iso8601 format (e.g. `"2015-06-29"`)

### <a name="intervallum">Intervallum</a>

The Intervallum class has some methods to assist you with different intervals, based on Ruby's `Time.now`

_For the date, June 29th 2015, being based in California, USA..._

###### List of Methods
<table>
  <thead>
    <tr>
      <td><strong>Method Name</strong></td>
      <td><strong>Description</strong></td>
      <td><strong>Example</strong></td>
    </tr>
  </thead>
  <tbody>
    <tr>
       <td>.today <sup><a href="#one">1</a></sup></td>
       <td>the current day in iso8601</td>
       <td>"2015-06-29"</td>
    </tr>
    <tr>
       <td>.this_day <sup><a href="#two">2</a></sup></td>
       <td>returns only the day</td>
       <td>"29" (will lead a 0 if less than 10, e.g. "07")</td>
    </tr>
    <tr>
      <td>.scribed_day (alias: .wordy_day)</td>
      <td>returns the day in MDY format</td>
      <td>"June 29, 2015"</td>
    </tr>
    <tr>
      <td>.yesterday (alias: .previous_day) <sup><a href="#one">1</a></sup></td>
      <td>returns the previous day</td>
      <td>"2015-06-28"</td>
    </tr>
    <tr>
      <td>.tomorrow (alias: .next_day) <sup><a href="#one">1</a></sup></td>
      <td>returns the following day</td>
      <td>"2015-06-30"</td>
    </tr>
    <tr>
      <td>.first_of_the_month <sup><a href="#one">1</a></sup></td>
      <td>returns the first day of the current month</td>
      <td>"2015-06-01"</td>
    </tr>
    <tr>
      <td>.last_month (alias: .previous_month) <sup><a href="#one">1</a></sup></td>
      <td>returns the first day fo the previous month</td>
      <td>"2015-05-01"</td>
    </tr>
    <tr>
      <td>.current_month (alias: .this_month) <sup><a href="#two">2</a></sup></td>
      <td>returns the current month (will lead a 0 if less than 10)</td>
      <td>"06"</td>
    </tr>
    <tr>
      <td>.next_month <sup><a href="#one">1</a></sup></td>
      <td>returns the first day of the following month</td>
      <td>"2015-07-01"</td>
    </tr>
    <tr>
      <td>.last_year (alias: .previous_year)</td>
      <td>returns the previous year as a String</td>
      <td>"2014"</td>
    </tr>
    <tr>
      <td>.next_year (alias: .following_year)</td>
      <td>returns the next year as a String</td>
      <td>"2016"</td>
    </tr>
    <tr>
      <td>.current_year (alias: .this_year)</td>
      <td>returns the current year as a String</td>
      <td>"2015"</td>
    </tr>
    <tr>
      <td>.in_months <sup><a href="#three">3</a></sup></td>
      <td>returns the first day of the month, for an integer argument given as a +/- number</td>
      <td>.in_months(2) => "2015-08-01"</td>
    </tr>
    <tr>
      <td>.month_name (alias: wordy_month) <sup><a href="#three">3</a></sup></td>
      <td>takes an argument as a String or Integer and returns the month's name</td>
      <td>.month_name(4) => "April"</td>
    </tr>
  </tbody>
</table>

### <a name="spell">Spell</a>

There is another class within the Intervallum gem called _Spell_. It allows you to cast dates into other formats. Examples of this are:

```
string = '2015-06-29'
date = Spell.to_date string
# <Date: 2015-06-29 ((2457203j,0s,0n),+0s,2299161j)>

time = Spell.to_time date
# 2015-06-29 00:00:00 -0700

epoch = Spell.to_epoch time
# 1435561200

julian = Spell.to_julian epoch # returns a Julian Date object
# <Date: 2015-06-16 ((2457203j,0s,0n),+0s,Infj)>

iso = Spell.to_iso8601 julian
"2015-06-16"

iso_mod = Spell.to_iso8601_mod iso # returns an Integer in the iso8601 format, kind of...
20150616

new_date = Date.parse('2015-05-12')
Spell.to_string new_date
"2015-05-12"
```

Notes:

<a name="one">1</a> - For most methods in Intervallum, you can pass an argument, optionally. By default, it will return a String in the iso8601 format. In your arguments, don't worry about capitalization. Other formats are:

```
# Time Object
# the argument can be 't' or 'Time'
Intervallum.today 't'
2015-06-29 00:00:00 -0700

# Date Object
# the argument can be 'd' or 'Date'
Intervallum.today 'd'
#<Date: 2015-06-29 ((2457203j,0s,0n),+0s,2299161j)>

# Epoch Integer
# the argument can be 'e' or 'Epoch'
Intervallum.today 'e'
1435561200

# Julian date as a String
# the argument can be 'j' or 'Julian'
Intervallum.today 'j'
"2015-06-16"
```

<a name="two">2</a> - For some other methods in Intervallum, they may not return variable types but rather, Strings or Integers. For example:

```
# arg can be 'int' or 'integer', capitalization does not matter
Intervallum.this_day 'i'
29

Intervallum.this_day
"29"
```

<a name="three">3</a> - Argument can be a String or Integer

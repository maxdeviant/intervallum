# [intervallum](https://rubygems.org/gems/intervallum) [![Gem Version](https://badge.fury.io/rb/intervallum.svg)](http://badge.fury.io/rb/intervallum) [![Build Status](https://travis-ci.org/johnakers/intervallum.svg?branch=master)](https://travis-ci.org/johnakers/intervallum)
<img src="http://i.imgur.com/2VE0eTB.png" />

This is primarily a manipulation of Ruby's `Time.now`.

_NOTE: add on of Intervallum underway. Old methods will be supported. Time Objects vs Date Objects vs String Objects & Julian dates vs Gregorian will be supported_

#### Back Story

In my work, I've needed to access different timeframes and wanted a more concise way to go about it. I ended up making a class that pretty much did what all of this gem does. So, I decided to put it on the internet.

#### Usage

Everything is returned as a String. I do want to make this return either a `Time` Ruby object or an epoch time in the future.

`gem install intervallum`<br>
`bundle`

Everything is namespaced under `Intervallum`. For instance:
```ruby
Intervallum.[method_name]
```

And for now, that's it.

I'm not sure about older Rails projects but does work with Rails4.

<strong>Make sure you have at least version 1.0.1</strong>.<br>

1.0.0 was pushed to RubyGems with 2 bugs (one in `#tomorrow` and one in `#yesterday` that will break your code).

#### Availbable methods

If today was March 2, 2015...
<table>
  <tr>
    <td><strong>Method</strong></td>
    <td><strong>Result</strong></td>
    <td><strong>Comment</strong></td>
  </tr>
  <tr>
    <td>today</td>
    <td>"2015-03-02"</td>
    <td></td>
  </tr>
  <tr>
    <td>this_day</td>
    <td>"15"</td>
    <td></td>
  </tr>
  <tr>
    <td>wordy_day</td>
    <td>"March 2, 2015"</td>
    <td></td>
  </tr>
  <tr>
    <td>tomorrow</td>
    <td>"2015-03-03"</td>
    <td>alias: next_day</td>
  </tr>
  <tr>
    <td>yesterday</td>
    <td>"2015-03-01"</td>
    <td>alias: previous_day</td>
  </tr>
  <tr>
    <td>this_month</td>
    <td>"3"</td>
    <td></td>
  </tr>
  <tr>
    <td>first_of_the_month</td>
    <td>"2015-03-01"</td>
    <td></td>
  </tr>
  <tr>
    <td>last_month</td>
    <td>"2015-02-01"</td>
    <td>alias: previous_month</td>
  </tr>
  <tr>
    <td>next_month</td>
    <td>"2015-04-01"</td>
    <td></td>
  </tr>
  <tr>
    <td>wordy_month(3)</td>
    <td>"March"</td>
    <td>note: argument can be string or integer</td>
  </tr>
  <tr>
    <td>last_year</td>
    <td>"2014"</td>
    <td>alias: previous_year</td>
  </tr>
  <tr>
    <td>this_year</td>
    <td>"2015"</td>
    <td></td>
  </tr>
  <tr>
    <td>next_year</td>
    <td>"2016"</td>
    <td></td>
  </tr>
  <tr>
    <td>in_months(4)</td>
    <td>"2015-07-01"</td>
    <td>note: if letter is entered, current month is returned</td>
  </tr>
  <tr>
    <td>in_months(-2)</td>
    <td>"2015-01-01"</td>
    <td>note: if letter is entered, current month is returned</td>
  </tr>
  <tr>
    <td>wordy_gregorian_month</td>
    <td>"March"</td>
    <td>note: arg is optional. arg format if provided is 'yyyy-mm-dd'</td>
  </tr>
</table>

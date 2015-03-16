# intervallum

###Available Methods

<table>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>

- today                        # "2015-03-02"
- this_day                     # "02"
- wordy_day                    # "March 2, 2015"
- tomorrow                     # "2015-03-03"    , alias: next_day
- yesterday                    # "2015-03-01"    , alias: previous_day
- this_month                   # "3"
- first_of_the_month           # "2015-03-01"
- last_month                   # "2015-02-01"    , alias: previous_month
- next_month                   # "2015-04-01"
- wordy_month(3)               # "March"         , note:  argument can be string or integer
- last_year                    # "2014"          , alias: previous_year
- this_year                    # "2015"
- next_year                    # "2016"
- in_months(4)                 # "2015-07-01"    , note: if argument is letter (e.g. 'J'), argument turns to 0
- in_months(-2)                # "2015-01-01"    , note: if argument is letter (e.g. 'J'), argument turns to 0

All of these are namespaced with Intervallum. For instance: `#tomorrow` would be `Intervallum.tomorrow`

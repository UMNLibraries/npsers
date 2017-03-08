# NPSERS: Get all the NPS Employees!

A very simple library to iterate through employees contained within the [National Park Service Directory](https://www.nps.gov/directory/).
This library parses successive HTML pages (with nokogiri) and extracts employee data. Employee data is then
transformed to CSV and saved to a file that you specify. An example of such a file `run_npsers.rb` has been provided
at the root level of this repository for your reference.

## Requiremens

* Ruby

## Use

* git clone https://github.com/chadfennell/npsers
* cd npsers
* gem install npsers
* ruby run_npsers.rb
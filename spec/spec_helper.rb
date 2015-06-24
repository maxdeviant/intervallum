require 'rspec'
require 'time'
require_relative '../lib/intervallum'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
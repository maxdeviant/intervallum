begin
  require 'bundler/setup'
rescue LoadError
  puts 'Using Bundler is preferred'
end

require 'rspec'
require_relative '../lib/intervallum'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
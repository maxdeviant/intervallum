begin
  require 'bundler/setup'
rescue LoadError
  puts 'Using Bundler is preferred'
end

require 'rspec'
require_relative '../lib/intervallum'
lib = File.expand_path("../lib/", __FILE__)

Gem::Specification.new do |s|
  s.name                  = 'intervallum'
  s.version               = '1.2.11'
  s.summary               = "a manipulation of Ruby's Time.now"
  s.description           = s.description
  s.authors               = ["John Akers"]
  s.email                 = 'johnakersemail@gmail.com'
  s.require_paths         = %w[lib]
  s.required_ruby_version = '>= 1.9.3'
  s.files                 = ["lib/intervallum.rb", "lib/intervallum/module.spell.rb", "lib/intervallum/module.scroll.rb"]
  s.homepage              = 'http://www.github.com/johnakers/intervallum'
  s.license               = 'MIT'
end
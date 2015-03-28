Gem::Specification.new do |s|
  s.name				= 'intervallum'
  s.version			= '1.1.0'
  s.summary     = 'Time.now manipulation'
  s.description	= "A manipulation of Ruby's Time.now"
  s.authors 		= 'John Akers'
  s.email				= 'johnakersemail@gmail.com'
  s.homepage 		= 'https://github.com/johnakers/intervallum'
  s.files 			= ["Rakefile", "lib/intervallum.rb", "lib/intervallum/helpers.rb"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rspec'
end
Gem::Specification.new do |s|
  s.name				= 'intervallum'
  s.version			= '0.0.1'
  s.summary     = 'Timeframes'
  s.description	= 'Allows easier timeframes'
  s.authors 		= 'John Akers'
  s.email				= 'johnakersemail@gmail.com'
  s.homepage 		= ''
  s.files 			= ["Rakefile", "lib/intervallum.rb", "lib/intervallum/helpers.rb"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rspec'
end
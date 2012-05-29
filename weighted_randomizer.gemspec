# -*- encoding: utf-8 -*-

require File.expand_path('../lib/weighted_randomizer', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan LeCompte"]
  gem.email         = ["lecompte@gmail.com"]
  gem.description   = %q{Provides a common utility for weighted randomization}
  gem.summary       = %q{Provides a common utility for weighted randomization}
  gem.homepage      = "http://github.com/ryanlecompte/weighted_randomizer"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weighted_randomizer"
  gem.require_paths = ["lib"]
  gem.version       = WeightedRandomizer::VERSION

  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('yard')
end

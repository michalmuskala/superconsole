# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'superconsole/version'

Gem::Specification.new do |spec|
  spec.name          = 'superconsole'
  spec.version       = Superconsole::VERSION
  spec.authors       = ["Michal Muskala"]
  spec.email         = ["michal@muskala.eu"]
  spec.summary       = %q{Pipm your rails console!}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'pry',           '>= 0.10.0'
  spec.add_runtime_dependency 'pry-rails',     '>= 0.3.2'
  spec.add_runtime_dependency 'railties',      '>= 3.0', '< 5.0'
  spec.add_runtime_dependency 'pry-byebug',    '>= 1.3.3'
  spec.add_runtime_dependency 'awesome_print', '>= 1.2.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end

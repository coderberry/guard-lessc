# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/lessc/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-lessc"
  spec.version       = Guard::Lessc::VERSION
  spec.authors       = ["Eric Berry"]
  spec.email         = ["cavneb@gmail.com"]
  spec.description   = "Guard::Lessc automatically compiles less files to a target file when changes are made"
  spec.summary       = "Guard gem for the lessc command"
  spec.homepage      = "https://github.com/cavneb/guard-lessc"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "guard"
  spec.add_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

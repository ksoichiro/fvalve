# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fvalve/version'

Gem::Specification.new do |spec|
  spec.name          = "fvalve"
  spec.version       = Fvalve::VERSION
  spec.authors       = ["ksoichiro"]
  spec.email         = ["soichiro.kashima@gmail.com"]
  spec.summary       = %q{File generation keeper.}
  spec.description   = %q{fvalve keeps a certain number of files in a directory.}
  spec.homepage      = "https://github.com/ksoichiro/fvalve"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

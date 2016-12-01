# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumerize_search_options/version'

Gem::Specification.new do |spec|
  spec.name          = "enumerize_search_options"
  spec.version       = EnumerizeSearchOptions::VERSION
  spec.authors       = ["Alexandr Melnikov"]
  spec.email         = ["amelnikov@ergoserv.com"]

  spec.summary       = %q{Allow use Ransack & Enumerize.}
  spec.description   = %q{Allow use Ransack & Enumerize.}
  spec.homepage      = 'https://github.com/melnikovsansan/enumerize_search_options'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

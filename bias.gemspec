# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bias/version"

Gem::Specification.new do |spec|
  spec.name          = "bias"
  spec.version       = Bias::VERSION
  spec.authors       = ["Dennis Walters"]
  spec.email         = ["dwalters@engineyard.com"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/ess/bias-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'addressable', '~> 2.5.1'
  spec.add_dependency 'faraday', '~> 0.12.1'
  #spec.add_dependency 'mockable' '~> 0.1.1'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'webmock', '~> 3.0.1'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
end

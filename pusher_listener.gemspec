# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pusher_listener/version'

Gem::Specification.new do |spec|
  spec.name          = "pusher_listener"
  spec.version       = PusherListener::VERSION
  spec.authors       = ["Ramon Tayag", "Marc Ignacio"]
  spec.email         = ["ramon@aelogica.com", "marc@aelogica.com"]
  spec.description   = %q{Wrapper around PusherClient that reconnects when there is an error}
  spec.summary       = %q{Wrapper around PusherClient that reconnects when there is an error}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pusher-client", "~> 0.4.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1.1"
  spec.add_development_dependency "rspec", "~> 2.14.0"
  spec.add_development_dependency "pry", "~> 0.9.12.4"
end

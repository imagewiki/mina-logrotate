# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/logrotate/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-logrotate"
  spec.version       = Mina::Logrotate::VERSION
  spec.authors       = ["Rodrigo Otavio van den Berg Maia"]
  spec.email         = ["rodrigo@devlandia.net"]

  spec.summary       = %q{Logrotate integration with mina}
  spec.description   = %q{Logrotate features to use with mina}
  spec.homepage      = "https://github.com/imagewiki/mina-logrotate"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mina", "~> 0"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end

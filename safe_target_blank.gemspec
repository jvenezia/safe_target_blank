# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'safe_target_blank/version'

Gem::Specification.new do |spec|
  spec.name = 'safe_target_blank'
  spec.version = SafeTargetBlank::VERSION
  spec.authors = ['Jeremy Venezia']
  spec.email = ['veneziajeremy@gmail.com']

  spec.summary = %q{Adds noopener and noreferrer to target blank links in a Rails application.}
  spec.description = %q{Adds noopener and noreferrer to target blank links in a Rails application.}
  spec.homepage = 'https://github.com/jvenezia/safe_target_blank'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end

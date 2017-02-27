# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'npsers/version'

Gem::Specification.new do |spec|
  spec.name          = 'npsers'
  spec.version       = NPSERS::VERSION
  spec.authors       = ['chadfennell']
  spec.email         = ['fenne035@umn.edu']

  spec.summary       = %q{GET ALL THE NPS PERPLES!.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '~> 1.7.0.1'


  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'yard', '~> 0.9.0'
  spec.add_development_dependency 'webmock', '~> 1.24', '>= 1.24.0'
  spec.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.1'
end

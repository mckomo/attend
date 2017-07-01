# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attend/version'

Gem::Specification.new do |spec|
  spec.name          = 'attend'
  spec.version       = Attend::VERSION
  spec.authors       = ['Maciej Komorowski']
  spec.email         = ['mckomo@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'Register Zoho Poeople attendance using CLI'
  spec.description   = 'Attend is command line tool that will help you register your Zoho Poeople attendance in fast and easy way'
  spec.homepage      = 'https://github.com/mckomo/attend'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.15'
  spec.add_dependency 'clamp', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
end

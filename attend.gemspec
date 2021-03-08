# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attend/version'

Gem::Specification.new do |spec|
  spec.name          = 'attend'
  spec.version       = Attend::VERSION
  spec.authors       = ['Maciej Komorowski']
  spec.email         = ['mckomo@gmail.com']
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.7.2'

  spec.summary       = 'Register Zoho People attendance using CLI'
  spec.description   = 'Attend is CLI tool that will help you register your Zoho People attendance in fast and easy way'
  spec.homepage      = 'https://github.com/mckomo/attend'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'clamp', '~> 1.3'
  spec.add_dependency 'http', '~> 4.4'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 1.11'
end

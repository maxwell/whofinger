# -*- encoding: utf-8 -*-
require File.expand_path('../lib/whofinger/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Maxwell Salzberg"]
  gem.email         = ["maxwell@joindiaspora.com"]
  gem.description   = %q{a webfinger client in Ruby}
  gem.summary       = %q{Great for Webfingering people!}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "whofinger"
  gem.require_paths = ["lib"]
  gem.version       = Whofinger::VERSION

  gem.add_development_dependency 'rspec', '~> 2.9'
  gem.add_development_dependency 'rake'
  gem.add_runtime_dependency 'faraday'
  gem.add_runtime_dependency 'faraday_middleware'
  gem.add_runtime_dependency 'nokogiri'
  gem.add_runtime_dependency 'webmock'
end

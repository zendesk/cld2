# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cld2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zendesk", "Alessandro Dal Grande", "Jason Toy"]
  gem.email         = ["dev@zendesk.com"]
  gem.description   = %q{Compact Language Detection for Ruby}
  gem.summary       = %q{Compact Language Detection for Ruby}
  gem.homepage      = "https://github.com/zendesk/cld2"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.extensions    = ["ext/cld2/extconf.rb"]
  gem.name          = "ruby_cld2"
  gem.require_paths = ["lib"]
  gem.version       = CLD2::VERSION

  gem.add_dependency "ffi", "~> 1.9.3"

  gem.add_development_dependency "rspec", "~> 2.14.1"
  gem.add_development_dependency "bump"
end

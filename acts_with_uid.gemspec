# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_with_uid/version'

Gem::Specification.new do |gem|
  gem.name          = "acts_with_uid"
  gem.version       = ActsWithUid::VERSION
  gem.authors       = ["Pierre G."]
  gem.email         = ["pierr@pifleo.fr"]
  gem.description   = %q{Auto fill models with :uid field and disable :uid setter}
  gem.summary       = %q{Fill :uid field}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activerecord'
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vodoo/version"

Gem::Specification.new do |s|
  s.name        = "vodoo"
  s.version     = Vodoo::VERSION
  s.authors     = ["Brandon Mathis"]
  s.email       = ["Brandon@KeysetTS.com"]
  s.homepage    = "http://brandonmathis.me"
  s.summary     = %q{A todo list for ppl who love to do things.}
  s.description = %q{A todo list for ppl who love to do things.}

  s.rubyforge_project = "vodoo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

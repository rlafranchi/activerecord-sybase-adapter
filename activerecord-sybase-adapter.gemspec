# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "core_ext"

Gem::Specification.new do |s|
  s.name        = "activerecord-sybase-adapter"
  s.version     = "3.1.0"
  s.summary     = "ActiveRecord adapter for Sybase."
  s.description = "ActiveRecord adapter for Sybase."

  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.8.7"

  s.authors     = ["John R. Sheets", "Marcello Barnaba", "Simone Carletti",   "Darrin Thompson"   ]
  s.email       = ["",               "vjt@openssl.it",   "weppos@weppos.net", "darrinth@gmail.com"]
  s.homepage    = "http://github.com/ifad/activerecord-sybase-adapter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("rake")
  s.add_development_dependency("yard")

  s.add_dependency "tiny_tds", "~> 0.5"
end

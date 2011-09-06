# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib/', __FILE__)

Gem::Specification.new do |s|
  s.name        = "activerecord-sybase-adapter"
  s.version     = 1.0
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John R. Sheets", "Marcello Barnaba", "Simone Carletti"]
  s.email       = ["", "vjt@openssl.it", "weppos@weppos.net"]
  s.homepage    = "http://github.com/ifad/activerecord-sybase-adapter"
  s.summary     = "ActiveRecord adapter for Sybase."
  s.description = "ActiveRecord adapter for Sybase."

  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir.glob("lib/**/*") + %w(README.markdown)
  s.require_path = 'lib'
end

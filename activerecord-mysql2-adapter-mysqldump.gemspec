# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "activerecord-mysql2-adapter-mysqldump/version"

Gem::Specification.new do |s|
  s.name        = "activerecord-mysql2-adapter-mysqldump"
  s.version     = Activerecord::Mysql2::Adapter::Mysqldump::VERSION
  s.authors     = ["Scott Holden"]
  s.email       = ["scott@sshconnection.com"]
  s.homepage    = "activerecord-mysql2-adapter-mysqldump"
  s.summary     = %q{This gem will dump database structure using mysqldump}
  s.description = %q{Will dump db structure with mysqldump, preserving views etc}

  s.rubyforge_project = "activerecord-mysql2-adapter-mysqldump"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency 'mysql2'
  s.add_runtime_dependency "activerecord", "3.1.3"
end

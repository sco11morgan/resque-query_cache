
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "resque/plugins/query_cache/version"

Gem::Specification.new do |spec|
  spec.name          = "resque-query_cache"
  spec.version       = Resque::Plugins::QueryCache::VERSION
  spec.authors       = ["Scott Morgan"]
  spec.email         = ["smorgan@groupon.com"]

  spec.summary       = %q{Enable ActiveRecord query cache for Resque jobs}
  spec.description   = %q{Enable ActiveRecord query cache for Resque jobs}
  spec.homepage      = "https://github.com/sco11morgan/resque-query_cache"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "> 3.2"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "resque", "~> 1.2"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3"
end

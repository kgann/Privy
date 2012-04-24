$:.push File.expand_path("../lib", __FILE__)

require "privy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "privy"
  s.version     = Privy::VERSION
  s.authors     = ["Outlandish Labs"]
  s.email       = ["kgann@outlandishlabs.com"]
  s.homepage    = "outlandishlabs.com"
  s.summary     = "User authentication and account management gem"
  s.description = "Prvy provides any rails application te ability to manage, create and authenticate users."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end

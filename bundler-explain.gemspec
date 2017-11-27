$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bundler/explain/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bundler-explain"
  s.version     = Bundler::Explain::VERSION
  s.authors     = ["Dmitriy"]
  s.email       = ["vkosmos26@yandex.ru"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Bundler::Explain."
  s.description = "TODO: Description of Bundler::Explain."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end

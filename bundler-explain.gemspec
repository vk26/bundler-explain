$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bundler/explain/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bundler-explain"
  s.version     = Bundler::Explain::VERSION
  s.authors     = ["Dmitriy Belyavtsev"]
  s.email       = ["vkosmos26@yandex.ru"]
  s.homepage    = ""
  s.summary     = "Summary of Bundler::Explain."
  s.description = "Description of Bundler::Explain."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # s.add_dependency "rails"

  # s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
end

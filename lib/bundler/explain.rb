module Bundler
  class Explain
    def initialize(gem_name)
      @gem_name = gem_name
    end

    def call
      gemfile_lock_hash = Bundler::Explain::Parser.call
      dependency_tree = Bundler::Explain::DependencyAnalyzer.new(gemfile_lock_hash, gem_name).call
      Bundler::Explain::Renderer.new(dependency_tree).call
    end
  end
end

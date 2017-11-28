module Bundler
  module Explain
    class DependencyAnalyzer
      def initialize(gemfile_lock_hash, gem_name)
        @gemfile_lock_hash = gemfile_lock_hash
        @gem_name = gem_name
      end

      def call
        # TODO: find dependencies for gem and return hash of dependencies tree
      end
    end
  end
end

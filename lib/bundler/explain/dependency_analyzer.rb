module Bundler
  module Explain
    class DependencyAnalyzer
      def initialize(gemfile_lock_hash, gem_name)
        @gemfile_lock_hash = gemfile_lock_hash
        @gem_name = gem_name
      end

      def call
        # TODO:
      end
    end
  end
end
